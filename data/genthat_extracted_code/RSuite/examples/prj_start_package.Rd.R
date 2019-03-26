library(RSuite)


### Name: prj_start_package
### Title: Creates package structure inside the project.
### Aliases: prj_start_package

### ** Examples

# create exemplary project base folder
prj_base <- tempfile("example_")
dir.create(prj_base, recursive = TRUE, showWarnings = FALSE)

# start project
prj <- prj_start("my_project", skip_rc = TRUE, path = prj_base)

# start package in it
prj_start_package("mypackage", prj = prj, skip_rc = TRUE)




