library(RSuite)


### Name: prj_load
### Title: Loads project into the environment so all master scripts can
###   run.
### Aliases: prj_load

### ** Examples

# create exemplary project base folder
prj_base <- tempfile("example_")
dir.create(prj_base, recursive = TRUE, showWarnings = FALSE)

# start project
prj <- prj_start("my_project", skip_rc = TRUE, path = prj_base)

cat(.libPaths(), sep = "\n") # show inital contents of .libPaths()

prj_load(prj = prj) # load project
cat(.libPaths(), sep = "\n") # show contents of .libPaths()

prj_unload() # restore environment
cat(.libPaths(), sep = "\n") # show final contents of .libPaths()




