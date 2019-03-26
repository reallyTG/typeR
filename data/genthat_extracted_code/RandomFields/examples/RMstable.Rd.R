library(RandomFields)


### Name: RMstable
### Title: Stable Family / Powered Exponential Model
### Aliases: RMstable 'powered exponential' RMpoweredexp
###   RMpoweredexponential
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

model <- RMstable(alpha=1.9, scale=0.4)
x <- seq(0, 10, 0.02)
plot(model)
plot(RFsimulate(model, x=x))
## Don't show: 
FinalizeExample()
## End(Don't show)


