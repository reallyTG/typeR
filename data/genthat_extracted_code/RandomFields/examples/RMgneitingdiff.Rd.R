library(RandomFields)


### Name: RMgneitingdiff
### Title: Gneiting Covariance Model Used as Tapering Function
### Aliases: RMgneitingdiff
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again
model <- RMgneitingdiff(nu=2, taper.scale=1, scale=0.2)
x <- seq(0, 10, 0.02)
plot(model)
plot(RFsimulate(model, x=x))
## Don't show: 
FinalizeExample()
## End(Don't show)


