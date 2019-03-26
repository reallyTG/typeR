library(RSuite)


### Name: pkgzip_build_package_files
### Title: Builds PKGZIP out of passed package files.
### Aliases: pkgzip_build_package_files

### ** Examples

## No test: 
  # download logging package
  pkg_fpath <- utils::download.packages("logging",
                                        repos = "https://cloud.r-project.org/",
                                        destdir = tempdir())[1,2]

  # build PKGZIP
  pkgzip_fpath <- pkgzip_build_package_files(files = pkg_fpath, path = tempdir())

  # list content of pkgzip created
  unzip(pkgzip_fpath, list = TRUE)
## End(No test)




