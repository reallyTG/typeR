library(RandomFields)


### Name: RMcauchy
### Title: Cauchy Family Covariance Model
### Aliases: RMcauchy
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

model <- RMcauchy(gamma=1)
x <- seq(0, 10, 0.02)
plot(model, xlim=c(-3, 3))
plot(RFsimulate(model, x=x, n=4))
## Don't show: 
FinalizeExample()
## End(Don't show)


