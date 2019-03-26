library(RSuite)


### Name: repo_mng_start
### Title: Starts management over the repository.
### Aliases: repo_mng_start

### ** Examples

# create exemplary project base folder
prj_base <- tempfile("example_")
dir.create(prj_base, recursive = TRUE, showWarnings = FALSE)

# start project
prj <- prj_start("my_project", skip_rc = TRUE, path = prj_base)

# set it to use in project repository and CRAN
prj_config_set_repo_adapters(c("Dir", "CRAN"), prj = prj)

# start managing in project repository
rmgr <- repo_mng_start("Dir", prj = prj, ix = 1)

# stop repository management
repo_mng_stop(rmgr)




