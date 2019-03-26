library(RSuite)


### Name: prj_install_deps
### Title: Installs project dependencies and needed supportive packages.
### Aliases: prj_install_deps

### ** Examples

## No test: 
  # create exemplary project base folder
  prj_base <- tempfile("example_")
  dir.create(prj_base, recursive = TRUE, showWarnings = FALSE)

  # start project
  prj <- prj_start("my_project", skip_rc = TRUE, path = prj_base)

  # reinstall logging package into project environment
  prj_install_deps(prj = prj, clean = TRUE)
## End(No test)




