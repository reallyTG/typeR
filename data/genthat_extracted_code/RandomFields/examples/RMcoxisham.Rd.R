library(RandomFields)


### Name: RMcoxisham
### Title: Cox Isham Covariance Model
### Aliases: RMcoxisham
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

model <- RMcoxisham(RMgauss(), mu=1, D=1)
x <- seq(0, 10, 0.3)
plot(model, dim=2)
plot(RFsimulate(model, x=x, y=x))
## Don't show: 
FinalizeExample()
## End(Don't show)


