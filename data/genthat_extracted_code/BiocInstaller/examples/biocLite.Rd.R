library(BiocInstaller)


### Name: biocLite
### Title: Install or update Bioconductor and CRAN packages
### Aliases: biocLite BIOCINSTALLER_ONLINE_DCF
### Keywords: environment

### ** Examples

## Not run: 
##D ## Change default Bioconductor and CRAN mirrors
##D chooseBioCmirror()
##D chooseCRANmirror()
##D 
##D ## If you don't have the BiocInstaller package installed, you can 
##D ## quickly install and load it as follows:
##D source("https://bioconductor.org/biocLite.R")  # 'http' if 'https' unavailable
##D 
##D ## The most recent version of the BiocInstaller package is now loaded.
##D ## No need to load it with library().
##D 
##D ## installs default packages (if not already installed) and updates
##D ## previously installed packages
##D biocLite()
##D 
##D ## Now install a CRAN package:
##D biocLite("survival")
##D 
##D ## install a Bioconductor package, but don't update all installed
##D ## packages as well:
##D biocLite("GenomicRanges", suppressUpdates=TRUE)
##D 
##D ## Install default packages, but do not update any package whose name
##D ## starts with "org." or "BSgenome."
##D biocLite(suppressUpdates=c("^org\.", "^BSgenome\."))
##D 
##D ## install a package from source:
##D biocLite("IRanges", type="source")
##D 
##D ## install all Bioconductor software packages
##D biocLite(all_group())
##D 
## End(Not run)
## Show the Bioconductor and CRAN repositories that will be used to
## install/update packages.
biocinstallRepos()

## Use local archive rather than current online configuration
## information. Set this prior to loading the BiocInstaller package.
options(BIOCINSTALLER_ONLINE_DCF = FALSE)



