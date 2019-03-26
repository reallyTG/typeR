library(RandomFields)


### Name: RMmastein
### Title: Ma-Stein operator
### Aliases: RMmastein
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make plotthem all random again
model <- RMmastein(RMgauss(), nu=1, delta=10)
plot(RMexp(), model.mastein=model, dim=2)

x <- seq(0, 10, 0.1)
plot(RFsimulate(model, x=x, y=x))
## Don't show: 
FinalizeExample()
## End(Don't show)


