library(RandomFields)


### Name: GaussianFields
### Title: Methods for Gaussian Random Fields
### Aliases: Gaussian
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

set.seed(1)
x <- runif(90, 0, 500)
z <- RFsimulate(RMspheric(), x)
z <- RFsimulate(RMspheric(), x, max_variab=10000)
## Don't show: 
FinalizeExample()
## End(Don't show)


