library(RandomFields)


### Name: RPt
### Title: Simulation of T Random Fields
### Aliases: RPt
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

model <- RPt(RMexp(), nu=2)
x <- seq(0, 10, 0.1)
z <- RFsimulate(model, x, x, n=4)
plot(z)

## Don't show: 
FinalizeExample()
## End(Don't show)


