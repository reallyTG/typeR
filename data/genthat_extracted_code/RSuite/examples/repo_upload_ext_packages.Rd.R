library(RSuite)


### Name: repo_upload_ext_packages
### Title: Uploads external packages into the managed repository.
### Aliases: repo_upload_ext_packages

### ** Examples

## No test: 
  # create exemplary project base folder
  prj_base <- tempfile("example_")
  dir.create(prj_base, recursive = TRUE, showWarnings = FALSE)

  # start project
  prj <- prj_start("my_project", skip_rc = TRUE, path = prj_base)

  # set it to use in project repository and CRAN
  prj_config_set_repo_adapters(c("Dir", "CRAN"), prj = prj)

  # start managing in project repository
  rmgr <- repo_mng_start("Dir", prj = prj, ix = 1)

  # upload logging package from CRAN into the repository
  repo_upload_ext_packages(rmgr, "logging", prj = prj, pkg_type = "source")

  # list available packages
  repo_mng_list(rmgr, pkg_type = "source")

  # stop repository management
  repo_mng_stop(rmgr)
## End(No test)




