library(RSuite)


### Name: prj_build
### Title: Builds project internal packages and installs them.
### Aliases: prj_build

### ** Examples

## No test: 
  # create exemplary project base folder
  prj_base <- tempfile("example_")
  dir.create(prj_base, recursive = TRUE, showWarnings = FALSE)

  # start project
  prj <- prj_start("my_project", skip_rc = TRUE, path = prj_base)

  # create package in the project
  prj_start_package("mypackage", prj = prj, skip_rc = TRUE)

  # build project local environment
  prj_install_deps(prj = prj)

  # build mypackage and install it into project environment
  prj_build(prj = prj)
## End(No test)




