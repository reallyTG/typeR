library(RandomFields)


### Name: RMnugget
### Title: Nugget Effect Covariance Model
### Aliases: RMnugget RM_NUGGET
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

x <- y <- 1:2
xy <- as.matrix(expand.grid(x, y)) ## we get 4 locations

## Standard use of the nugget effect
model <- RMnugget(var = 100)
RFcovmatrix(model, x=xy)
as.vector(RFsimulate(model, x=x, y=x, tol=1e-10))

## Don't show: 
FinalizeExample()
## End(Don't show)


