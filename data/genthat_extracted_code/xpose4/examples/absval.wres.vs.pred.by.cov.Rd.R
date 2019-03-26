library(xpose4)


### Name: absval.wres.vs.pred.by.cov
### Title: Absolute population weighted residuals vs population
###   predictions, conditioned on covariates, for Xpose 4
### Aliases: absval.wres.vs.pred.by.cov

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
##D absval.wres.vs.pred.by.cov(xpdb)
##D 
##D ## Custom axis labels
##D absval.wres.vs.pred.by.cov(xpdb, ylb="|CWRES|", xlb="PRED")
##D 
##D ## Custom colours and symbols, IDs
##D absval.wres.vs.pred.by.cov(xpdb, cex=0.6, pch=3, col=1, ids=TRUE)
## End(Not run)




