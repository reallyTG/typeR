library(SPOT)


### Name: funCyclone
### Title: Objective function - Cyclone Simulation: Barth/Muschelknautz
### Aliases: funCyclone

### ** Examples

## Call directly
funCyclone(c(1.26,2.5))
## create vectorized target funcion, vectorized, first objective only
## Also: negated, since SPOT always does minimization.
tfunvecF1 <-function(x){-apply(x,1,funCyclone)[1,]}
tfunvecF1(matrix(c(1.26,2.5,1,2),2,2,byrow=TRUE))
## optimize with spot
res <- spot(fun=tfunvecF1,lower=c(1,2),upper=c(2,3),
   control=list(modelControl=list(target="ei"),
   model=buildKriging,optimizer=optimLBFGSB,plots=TRUE)) 
## best found solution ...
res$xbest
## ... and its objective function value
res$ybest




