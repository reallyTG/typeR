library(SpatialVS)


### Name: SpatialVS
### Title: Function for spatial variable selection
### Aliases: SpatialVS
### Keywords: function

### ** Examples

#use small.test.dat as the input to fit the spatial Poisson regression model.
#a grid of alpha.vec and lambda.vec is typically used.
#Here one point of alpha.vec and lambda.vec is used for fast illustration.

test.fit<-SpatialVS(dat.obj=small.test.dat, alpha.vec=0.5,
lambda.vec=5, method="PQL", intercept=TRUE, verbose=FALSE)



