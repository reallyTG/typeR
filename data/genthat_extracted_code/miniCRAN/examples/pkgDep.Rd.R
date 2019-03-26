library(miniCRAN)


### Name: pkgDep
### Title: Retrieves package dependencies.
### Aliases: pkgDep

### ** Examples


## Not run: 
##D pkgDep(pkg = c("ggplot2", "plyr", "reshape2"),
##D        repos = c(CRAN = getOption("minicran.mran"))
##D )
## End(Not run)

pdb <- cranJuly2014
## Not run: 
##D pdb <- pkgAvail(repos = c(CRAN = getOption("minicran.mran")))
## End(Not run)

pkgDep(pkg = c("ggplot2", "plyr", "reshape2"), pdb)




