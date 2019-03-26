library(RandomFields)


### Name: RMnsst
### Title: Non-Separable Space-Time model
### Aliases: RMnsst
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

model <- RMnsst(phi=RMgauss(), psi=RMfbm(alpha=1), delta=2)
x <- seq(0, 10, 0.25)
plot(model, dim=2)
plot(RFsimulate(model, x=x, y=x))
## Don't show: 
FinalizeExample()
## End(Don't show)


