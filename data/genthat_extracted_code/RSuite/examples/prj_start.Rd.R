library(RSuite)


### Name: prj_start
### Title: Creates project structure at the specified path.
### Aliases: prj_start

### ** Examples

# create exemplary project base folder
prj_base <- tempfile("example_")
dir.create(prj_base, recursive = TRUE, showWarnings = FALSE)

# start project
prj <- prj_start("my_project", skip_rc = TRUE, path = prj_base)




