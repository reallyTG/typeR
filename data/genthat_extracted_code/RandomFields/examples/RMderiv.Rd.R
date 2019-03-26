library(RandomFields)


### Name: RMderiv
### Title: Gradient of a field
### Aliases: RMderiv derivative gradient
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

model <- RMderiv(RMgauss(), scale=4)
plot(model, dim=2)

x.seq <- y.seq <- seq(-10, 10, 0.4)
simulated <- RFsimulate(model=model, x=x.seq, y=y.seq)

plot(simulated)
## Don't show: 
FinalizeExample()
## End(Don't show)


