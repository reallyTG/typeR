library(RandomFields)


### Name: Hyperplane
### Title: Hyperplane method
### Aliases: Hyperplane Hyperplanes RPhyperplane
### Keywords: methods

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again
model <- RPhyperplane(RMexp(s=2), superpos=1)
x <- seq(0, 3, 0.04)
z <- RFsimulate(x=x, x, model=model, n=1)
plot(z)

## Don't show: 
FinalizeExample()
## End(Don't show)


