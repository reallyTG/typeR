library(RandomFields)


### Name: RMcovariate
### Title: Model for covariates
### Aliases: RMcovariate RM_COVARIATE
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample(reduced = FALSE)
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

z <- 0.2 + (1:10)
RFfctn(RMcovariate(z), 1:10)
RFfctn(RMcovariate(data=z, x=1:10), c(2, 2.1, 2.5, 3))

## Don't show: 
FinalizeExample()
## End(Don't show)


