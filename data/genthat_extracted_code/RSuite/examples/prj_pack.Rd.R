library(RSuite)


### Name: prj_pack
### Title: Prepares project source pack tagged with version.
### Aliases: prj_pack

### ** Examples

# create exemplary project base folder
prj_base <- tempfile("example_")
dir.create(prj_base, recursive = TRUE, showWarnings = FALSE)

# start project
prj <- prj_start("my_project", skip_rc = TRUE, path = prj_base)

# create package in the project
prj_start_package("mypackage", prj = prj, skip_rc = TRUE)

# build project source pack
pack_fpath <- prj_pack(prj = prj, path = tempdir(), pack_ver = "1.0")




