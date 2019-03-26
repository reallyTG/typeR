library(RandomFields)


### Name: RMlsfbm
### Title: Locally Positive Definite Function Given by the Fractal Brownian
###   Motion
### Aliases: RMlsfbm
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

model <- RMlsfbm(alpha=1, scale=10)
x <- seq(0, 10, 0.02)
plot(model, xlim=c(0,10))
plot(RFsimulate(model, x=x))
## Don't show: 
FinalizeExample()
## End(Don't show)


