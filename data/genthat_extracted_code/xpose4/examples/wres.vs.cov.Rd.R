library(xpose4)


### Name: wres.vs.cov
### Title: Weighted residuals (WRES) plotted against covariates, for Xpose
###   4
### Aliases: wres.vs.cov
### Keywords: methods

### ** Examples


## Not run: 
##D ## We expect to find the required NONMEM run and table files for run
##D ## 5 in the current working directory
##D xpdb5 <- xpose.data(5)
##D 
##D ## Here we load the example xpose database 
##D data(simpraz.xpdb)
##D xpdb <- simpraz.xpdb
##D 
##D ## A vanilla plot
##D wres.vs.cov(xpdb)
##D 
##D ## Custom colours and symbols, IDs
##D wres.vs.cov(xpdb, cex=0.6, pch=3, col=1, ids=TRUE)
## End(Not run)




