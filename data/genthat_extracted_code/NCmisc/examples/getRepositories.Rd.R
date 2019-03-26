library(NCmisc)


### Name: getRepositories
### Title: Detect all available R repositories.
### Aliases: getRepositories

### ** Examples

require(BiocInstaller)
repos <- "http://cran.ma.imperial.ac.uk/" # OR: repos <- getOption("repos")
getRepositories(table=TRUE) # shows all available
getRepositories(2:5,FALSE) # returns index for all bioconductor repositories (on my system at least)
search.cran("genoset",repos=getRepositories(1)) # does not find this bioconductor package on CRAN
search.cran("genoset",repos=getRepositories()) # should now, because all repositories are used



