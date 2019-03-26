library(kutils)


### Name: updatePackages
### Title: Update packages, spot new dependencies, and install them
### Aliases: updatePackages

### ** Examples

## Not run: 
##D myrepos <- c("http://rweb.crmda.ku.edu/cran",
##D              "http://www.bioconductor.org/packages/3.3/bioc")
##D updatePackages(repos = myrepos)
##D ## libnew defaults to "/usr/share/R/library". Specify NULL
##D ## so that new packages will go to user's directory
##D updatePackages(libnew = NULL)
## End(Not run)



