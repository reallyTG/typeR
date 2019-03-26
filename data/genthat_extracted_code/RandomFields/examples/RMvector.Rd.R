library(RandomFields)


### Name: RMvector
### Title: Vector Covariance Model
### Aliases: RMvector
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

model <- RMvector(RMgauss(), scale=0.3)
x <- seq(0, 10, 0.4)
plot(RFsimulate(model, x=x, y=x, z=0), select.variables=list(1:2))
## Don't show: 
FinalizeExample()
## End(Don't show)


