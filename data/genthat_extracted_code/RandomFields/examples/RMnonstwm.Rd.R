library(RandomFields)


### Name: RMnonstwm
### Title: Non-stationary Whittle-Matern Covariance Model
### Aliases: RMnonstwm
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again
x <- seq(-1.2, 1.2, len=50)
model <- RMwhittle(nu=RMgauss())
z <- RFsimulate(model=model, x, x, n=4)
plot(z)
## Don't show: 
FinalizeExample()
## End(Don't show)


