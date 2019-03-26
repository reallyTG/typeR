library(RandomFields)


### Name: RMid
### Title: Identical Model
### Aliases: RMid
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

## C(x,y) = < x, y >
RFcov(RMprod(RMid()), as.matrix(1:10), as.matrix(1:10), grid=FALSE)
## Don't show: 
FinalizeExample()
## End(Don't show)


