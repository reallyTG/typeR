library(RandomFields)


### Name: RMflatpower
### Title: Variogram Model Similar to Fractal Brownian Motion
### Aliases: RMflatpower
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

model <- RMflatpower(alpha=0.5)
x <- seq(0, 10, 0.1)
plot(model)
plot(RFsimulate(model, x=x))
## Don't show: 
FinalizeExample()
## End(Don't show)


