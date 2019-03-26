library(RandomFields)


### Name: RMmatrix
### Title: Matrix operator
### Aliases: RMmatrix coregionalisation coregionalization
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)

RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again


## Not run: 
##D ## first example: bivariate Linear Model of Coregionalisation
##D x <- y <- seq(0, 10, 0.2)
##D 
##D model1 <- RMmatrix(M = c(0.9, 0.43), RMwhittle(nu = 0.3)) + 
##D   RMmatrix(M = c(0.6, 0.8), RMwhittle(nu = 2))
##D plot(model1)
##D simu1 <- RFsimulate(RPdirect(model1), x, y)
##D plot(simu1)
##D 
##D 
##D ## second, equivalent way of defining the above model
##D model2 <- RMmatrix(M = matrix(ncol=2, c(0.9, 0.43, 0.6, 0.8)),
##D                   c(RMwhittle(nu = 0.3), RMwhittle(nu = 2)))
##D simu2 <- RFsimulate(RPdirect(model2), x, y)
##D stopifnot(all.equal(as.array(simu1), as.array(simu2)))
##D 
##D 
##D ## third, equivalent way of defining the above model
##D model3 <- RMmatrix(M = matrix(ncol=2, c(0.9, 0.43, 0.6, 0.8)),
##D                    RMwhittle(nu = 0.3), RMwhittle(nu = 2))
##D simu3 <- RFsimulate(RPdirect(model3), x, y)
##D stopifnot(all(as.array(simu3) == as.array(simu2)))
## End(Not run)


## second example: bivariate, independent fractional Brownian motion
## on the real axis
x <- seq(0, 10, 0.1) 
modelB <- RMmatrix(c(RMfbm(alpha=0.5), RMfbm(alpha=1.5))) ## see the Note above
print(modelB)
simuB <- RFsimulate(modelB, x)
plot(simuB)


## third example: bivariate non-stationary field with exponential correlation
## function. The variance of the two components is given by the
## variogram of fractional Brownian motions.
## Note that the two components have correlation 1.
x <- seq(0, 10, 0.1)
modelC <- RMmatrix(RMexp(), M=c(RMfbm(alpha=0.5), RMfbm(alpha=1.5))) 
print(modelC)
simuC <- RFsimulate(modelC, x, x, print=1)
#print(as.vector(simuC))
plot(simuC)

## Don't show: 
FinalizeExample()
## End(Don't show)



