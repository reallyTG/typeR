library(RandomFields)


### Name: RMexponential
### Title: Exponential operator
### Aliases: RMexponential RMexponential
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again
model <- RMexponential(RMfbm(alpha=1))  ## identical to RMexp()
plot(RMexp(), model=model, type=c("p", "l"), pch=20) 

## Don't show: 
FinalizeExample()
## End(Don't show)


