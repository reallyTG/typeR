library(RSuite)


### Name: pkgzip_build_bioc_package
### Title: Builds PKGZIP out of a package on Bioconductor
### Aliases: pkgzip_build_bioc_package

### ** Examples

## No test: 
  # create exemplary project base folder
  prj_base <- tempfile("example_")
  dir.create(prj_base, recursive = TRUE, showWarnings = FALSE)

  # start project
  prj <- prj_start("my_project", skip_rc = TRUE, path = prj_base)

  # build PKGZIP with logging package from cran repository
  pkgzip_fpath <- pkgzip_build_bioc_package("BiocGenerics", prj = prj, path = tempdir())

  # list content of pkgzip created
  unzip(pkgzip_fpath, list = TRUE)
## End(No test)




