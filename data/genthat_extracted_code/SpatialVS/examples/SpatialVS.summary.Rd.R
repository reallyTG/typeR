library(SpatialVS)


### Name: SpatialVS.summary
### Title: Function for spatial variable selection's summary
### Aliases: SpatialVS.summary

### ** Examples


test.fit<-SpatialVS(dat.obj=small.test.dat, alpha.vec=0.5, lambda.vec=5,
method="PQL", intercept=TRUE, verbose=FALSE)
SpatialVS.summary(test.fit)



