library(RandomFields)


### Name: RMstein
### Title: Stein's non-separable space-time model
### Aliases: RMstein
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

model <- RMstein(nu=1.5, z=0.9)
x <- seq(0, 10, 0.05)
plot(RFsimulate(model, x=x, y=x))
## Don't show: 
FinalizeExample()
## End(Don't show)


