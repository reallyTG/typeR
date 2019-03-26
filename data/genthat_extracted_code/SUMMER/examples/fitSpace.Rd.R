library(SUMMER)


### Name: fitSpace
### Title: Fit INLA models to perform simple space smoothing.
### Aliases: fitSpace

### ** Examples

## Not run: 
##D data(DemoData2)
##D data(DemoMap2)
##D fit <- fitSpace(data=DemoData2, geo=DemoMap2$geo, 
##D Amat=DemoMap2$Amat, family="binomial", 
##D responseVar="tobacco.use", strataVar="strata", 
##D weightVar="weights", regionVar="region", 
##D clusterVar = "~clustid+id", 
##D hyper=NULL, CI = 0.95)
## End(Not run)



