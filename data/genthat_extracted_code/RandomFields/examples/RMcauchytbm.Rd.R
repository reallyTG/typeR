library(RandomFields)


### Name: RMcauchytbm
### Title: Modifications of the Cauchy Family Covariance Model
### Aliases: RMcauchytbm
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

model <- RMcauchytbm(alpha=1, beta=1, gamma=3)
x <- seq(0, 10, 0.02)
plot(model)
plot(RFsimulate(model, x=x))
## Don't show: 
FinalizeExample()
## End(Don't show)


