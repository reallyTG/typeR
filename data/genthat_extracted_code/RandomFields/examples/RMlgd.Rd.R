library(RandomFields)


### Name: RMlgd
### Title: Local-Global Distinguisher Family Covariance Model
### Aliases: RMlgd
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

model <- RMlgd(alpha=0.7, beta=4, scale=0.5)
x <- seq(0, 10, 0.02)
plot(model)
plot(RFsimulate(model, x=x))
## Don't show: 
FinalizeExample()
## End(Don't show)


