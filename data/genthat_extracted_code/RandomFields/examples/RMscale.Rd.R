library(RandomFields)


### Name: RMscale
### Title: Scale model for arbitrary areas of scales
### Aliases: RMscale
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

x <- seq(0,1, 0.01)
scale <- RMcovariate(x=c(0,1), y=c(1,0),#2 areas separated by the 1st bisector
                     grid=FALSE, data=c(1, 3))

model <- RMscale(RMexp(), scaling = scale, penalty=RMid() / 2)
plot(z <- RFsimulate(model, x, x))


## Don't show: 
FinalizeExample()
## End(Don't show)


