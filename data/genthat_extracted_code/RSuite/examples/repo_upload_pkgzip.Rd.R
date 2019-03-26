library(RSuite)


### Name: repo_upload_pkgzip
### Title: Uploads PKGZIP into the managed repository.
### Aliases: repo_upload_pkgzip

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

  # create PKGZIP containing logging package
  pkgzip_fpath <- pkgzip_build_ext_packages("logging", prj = prj, pkg_type = "source",
                                            path = tempdir())

  # upload PKGZIP into the repository
  repo_upload_pkgzip(rmgr, pkgzip_fpath)

  # list available packages
  repo_mng_list(rmgr, pkg_type = "source")

  # stop repository management
  repo_mng_stop(rmgr)
## End(No test)




