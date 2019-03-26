library(RSuite)


### Name: prj_config_set_repo_adapters
### Title: Updates project configuration to use only specified repository
###   adapters.
### Aliases: prj_config_set_repo_adapters

### ** Examples

# create exemplary project base folder
prj_base <- tempfile("example_")
dir.create(prj_base, recursive = TRUE, showWarnings = FALSE)

# start project
prj <- prj_start("my_project", skip_rc = TRUE, path = prj_base)

# present initial project configuration
cat(readLines(file.path(prj$path, "PARAMETERS")), sep = "\n")

# set repositories to use
prj_config_set_repo_adapters(c("CRAN", "MRAN[2018-01-01]"), prj = prj)

# present final project configuration
cat(readLines(file.path(prj$path, "PARAMETERS")), sep = "\n")




