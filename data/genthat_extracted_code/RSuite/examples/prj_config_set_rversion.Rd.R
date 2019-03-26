library(RSuite)


### Name: prj_config_set_rversion
### Title: Updates project configuration to use specified R Version.
### Aliases: prj_config_set_rversion

### ** Examples

# create exemplary project base folder
prj_base <- tempfile("example_")
dir.create(prj_base, recursive = TRUE, showWarnings = FALSE)

# start project
prj <- prj_start("my_project", skip_rc = TRUE, path = prj_base)

# present initial project configuration
cat(readLines(file.path(prj$path, "PARAMETERS")), sep = "\n")

# set repositories to use
prj_config_set_rversion("3.2", prj = prj, validate = FALSE)

# present final project configuration
cat(readLines(file.path(prj$path, "PARAMETERS")), sep = "\n")




