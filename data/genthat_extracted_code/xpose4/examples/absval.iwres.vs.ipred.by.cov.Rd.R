library(xpose4)


### Name: absval.iwres.vs.ipred.by.cov
### Title: Absolute individual weighted residuals vs individual
###   predictions, conditioned on covariates, for Xpose 4
### Aliases: absval.iwres.vs.ipred.by.cov
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
##D absval.iwres.vs.ipred.by.cov(xpdb)
##D 
##D ## Custom axis labels
##D absval.iwres.vs.ipred.by.cov(xpdb, ylb="|IWRES|", xlb="IPRED")
##D 
##D ## Custom colours and symbols, no IDs
##D absval.iwres.vs.ipred.by.cov(xpdb, cex=0.6, pch=3, col=1, ids=FALSE)
## End(Not run)



