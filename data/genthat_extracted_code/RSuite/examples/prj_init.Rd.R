library(RSuite)


### Name: prj_init
### Title: Loads project settings without loading them into the
###   environment.
### Aliases: prj_init

### ** Examples

# create exemplary project base folder
prj_base <- tempfile("example_")
dir.create(prj_base, recursive = TRUE, showWarnings = FALSE)

# start project
prj_start("my_project", skip_rc = TRUE, path = prj_base)

# init project
prj <- prj_init(path = file.path(prj_base, "my_project"))




