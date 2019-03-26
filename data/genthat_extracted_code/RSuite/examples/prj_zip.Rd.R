library(RSuite)


### Name: prj_zip
### Title: Prepares deployment zip tagged with version.
### Aliases: prj_zip

### ** Examples

# create exemplary project base folder
prj_base <- tempfile("example_")
dir.create(prj_base, recursive = TRUE, showWarnings = FALSE)

# start project
prj <- prj_start("my_project", skip_rc = TRUE, path = prj_base)

# build deployment zip
zip_fpath <- prj_zip(prj = prj, path = tempdir(), zip_ver = "1.0")




