library(coin)


### Name: coin-package
### Title: General Information on the 'coin' Package
### Aliases: coin-package coin
### Keywords: package

### ** Examples

## Not run: 
##D ## Generate doxygen documentation if you are interested in the internals:
##D ## Download source package into a temporary directory
##D tmpdir <- tempdir()
##D tgz <- download.packages("coin", destdir = tmpdir, type = "source")[2]
##D ## Extract contents
##D untar(tgz, exdir = tmpdir)
##D ## Run doxygen (assuming it is installed)
##D wd <- setwd(file.path(tmpdir, "coin"))
##D system("doxygen inst/doxygen.cfg")
##D setwd(wd)
##D ## Have fun!
##D browseURL(file.path(tmpdir, "coin", "inst",
##D                     "documentation", "html", "index.html"))
## End(Not run)



