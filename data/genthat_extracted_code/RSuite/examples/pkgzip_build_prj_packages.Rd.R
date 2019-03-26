library(RSuite)


### Name: pkgzip_build_prj_packages
### Title: Builds PKGZIP out of project packages.
### Aliases: pkgzip_build_prj_packages

### ** Examples

## No test: 
  # create exemplary project base folder
  prj_base <- tempfile("example_")
  dir.create(prj_base, recursive = TRUE, showWarnings = FALSE)

  # start project
  prj <- prj_start("my_project", skip_rc = TRUE, path = prj_base)

  # start package in my_project
  prj_start_package("mypackage", skip_rc = TRUE, prj = prj)

  # build project environment and install supportives
  prj_install_deps(prj = prj, vanilla_sups = TRUE)

  # build PKGZIP
  pkgzip_fpath <- pkgzip_build_prj_packages(prj = prj, path = tempdir())

  # list content of pkgzip created
  unzip(pkgzip_fpath, list = TRUE)
## End(No test)




