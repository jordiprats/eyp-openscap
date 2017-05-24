class openscap::scanner::install inherits openscap::scanner {

  Exec {
    path => '/usr/sbin:/usr/bin:/sbin:/bin',
  }

  if($openscap::scanner::manage_package)
  {
    package { $openscap::params::scanner_package_name:
      ensure => $openscap::scanner::package_ensure,
    }
  }

  exec { "openscap scanner mkdir -p ${openscap:::scanner:basedir}":
    command => "mkdir -p ${openscap::scanner::basedir}",
    creates => $openscap::scanner::basedir,
  }

  file { $openscap::scanner::basedir:
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    require => Exec["openscap scanner mkdir -p ${openscap::scanner::basedir}"],
  }

  exec { "openscap scanner mkdir -p ${openscap::basedir}/profiles":
    command => "mkdir -p ${openscap::scanner::basedir}/profiles",
    creates => "${openscap::scanner::basedir}/profiles",
  }

  file { "${openscap::scanner::basedir}/profiles":
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    require => Exec["openscap scanner mkdir -p ${openscap::scanner::basedir}/profiles"],
  }

  exec { "openscap scanner mkdir -p ${openscap::scanner::basedir}/xccdf":
    command => "mkdir -p ${openscap::scanner::basedir}/xccdf",
    creates => "${openscap::scanner::basedir}/xccdf",
  }

  file { "${openscap::scanner::basedir}/xccdf":
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    require => Exec["openscap scanner mkdir -p ${openscap::scanner::basedir}/xccdf"],
  }

  exec { "openscap scanner mkdir -p ${openscap::scanner::basedir}/results":
    command => "mkdir -p ${openscap::scanner::basedir}/results",
    creates => "${openscap::scanner::basedir}/results",
  }

  file { "${openscap::scanner::basedir}/results":
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    require => Exec["openscap scanner mkdir -p ${openscap::scanner::basedir}/results"],
  }

  exec { "openscap scanner mkdir -p ${openscap::scanner::basedir}/reports":
    command => "mkdir -p ${openscap::scanner::basedir}/reports",
    creates => "${openscap::scanner::basedir}/reports",
  }

  file { "${openscap::scanner::basedir}/reports":
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    require => Exec["openscap scanner mkdir -p ${openscap::scanner::basedir}/reports"],
  }

}
