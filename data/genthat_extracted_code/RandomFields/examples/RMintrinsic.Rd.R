library(RandomFields)


### Name: RMintrinsic
### Title: Intrinsic Embedding Covariance Model
### Aliases: RMintrinsic
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

x.max <- 10
model <- RMintrinsic(RMfbm(alpha=1), diameter=x.max)
x <- seq(0, x.max, 0.02)
plot(model)
plot(RFsimulate(model, x=x))
## Don't show: 
FinalizeExample()
## End(Don't show)


