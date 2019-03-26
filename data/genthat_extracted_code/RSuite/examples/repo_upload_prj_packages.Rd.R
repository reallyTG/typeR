library(RSuite)


### Name: repo_upload_prj_packages
### Title: Builds and uploads project package(s) into the repository.
### Aliases: repo_upload_prj_packages

### ** Examples

## No test: 
  # create exemplary project base folder
  prj_base <- tempfile("example_")
  dir.create(prj_base, recursive = TRUE, showWarnings = FALSE)

  # start src project
  src_prj <- prj_start("my_project_src", skip_rc = TRUE, path = prj_base)

  # create project package
  prj_start_package("mypackage", prj = src_prj, skip_rc = TRUE)

  # build project environment
  prj_install_deps(prj = src_prj)

  # start dest project
  dst_prj <- prj_start("my_project_dst", skip_rc = TRUE, path = prj_base)

  # set dest to use in project repository and CRAN
  prj_config_set_repo_adapters(c("Dir", "CRAN"), prj = dst_prj)

  # start managing in project repository
  rmgr <- repo_mng_start("Dir", prj = dst_prj, ix = 1)

  # upload mypackage from src into dest's in project repository
  repo_upload_prj_packages(rmgr, prj = src_prj, skip_rc = TRUE)

  # list available packages
  repo_mng_list(rmgr)

  # stop repository management
  repo_mng_stop(rmgr)
## End(No test)




