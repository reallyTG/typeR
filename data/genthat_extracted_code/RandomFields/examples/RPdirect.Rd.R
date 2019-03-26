library(RandomFields)


### Name: Square root
### Title: Methods relying on square roots of the covariance matrix
### Aliases: Direct RPdirect
### Keywords: methods

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again
model <- RMgauss(var=10, s=10) + RMnugget(var=0.01)
plot(model, xlim=c(-25, 25))

z <- RFsimulate(model=RPdirect(model), 0:10, 0:10, n=4)
plot(z)

## Don't show: 
FinalizeExample()
## End(Don't show)


