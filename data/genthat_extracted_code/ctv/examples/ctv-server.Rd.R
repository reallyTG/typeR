library(ctv)


### Name: ctv-server
### Title: CRAN Task Views: Tools for Maintainers
### Aliases: read.ctv ctv2html check_ctv_packages repos_update_views
### Keywords: utilities

### ** Examples

## read .ctv file
x <- read.ctv(system.file("ctv", "Econometrics.ctv", package = "ctv"))
x

## Not run: 
##D ## generate corresponding .html file
##D ctv2html(x)
##D 
##D ## check packagelist
##D check_ctv_packages(x)
## End(Not run)



