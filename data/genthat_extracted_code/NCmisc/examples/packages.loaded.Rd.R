library(NCmisc)


### Name: packages.loaded
### Title: Check whether a set of packages has been loaded
### Aliases: packages.loaded

### ** Examples

require(BiocInstaller)
packages.loaded("NCmisc","reader")
packages.loaded(c("bigpca","nonsenseFailTxt")) # both not found, as second not real
packages.loaded(c("bigpca","nonsenseFailTxt"),cran.check=FALSE) # hide warning
packages.loaded() # no argument means all loaded packages are listed
packages.loaded("snpStats",repos=getRepositories(1)) # doesn't find the bioconductor package on CRAN
packages.loaded("snpStats",repos=getRepositories()) # now it can find it by using all repositories



