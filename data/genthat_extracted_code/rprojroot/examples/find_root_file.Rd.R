library(rprojroot)


### Name: find_root_file
### Title: File paths relative to the root of a directory hierarchy
### Aliases: find_root_file find_rstudio_root_file find_package_root_file
###   find_remake_root_file find_testthat_root_file

### ** Examples

## Not run: 
##D find_package_root_file("tests", "testthat.R")
##D has_file("DESCRIPTION", "^Package: ")$find_file
##D has_file("DESCRIPTION", "^Package: ")$make_fix_file(".")
## End(Not run)




