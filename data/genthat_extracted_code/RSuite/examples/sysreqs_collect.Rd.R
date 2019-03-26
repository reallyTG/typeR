library(RSuite)


### Name: sysreqs_collect
### Title: Prints out all system requirements from dependencies and project
###   packages.
### Aliases: sysreqs_collect

### ** Examples

## No test: 
  # create exemplary project base folder
  prj_base <- tempfile("example_")
  dir.create(prj_base, recursive = TRUE, showWarnings = FALSE)

  # start project
  prj <- prj_start("my_project", skip_rc = TRUE, path = prj_base)

  # add package to the project
  prj_start_package("mypackage", prj = prj)

  # add system requirements specification
  write("SystemRequirements: some requirement",
      file = file.path(prj$path, "packages", "mypackage", "DESCRIPTION"),
      append = TRUE)

  # list content of pkgzip created
  sysreqs_collect(prj)
## End(No test)



