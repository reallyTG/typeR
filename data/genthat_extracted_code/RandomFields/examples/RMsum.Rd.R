library(RandomFields)


### Name: RMsum
### Title: Plain scalar product
### Aliases: RMsum
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

## Don't show: ## Not run: 
##D RFfctn(RMsum(RMexp()), 1:10, grid=FALSE)
##D RFfctn(RMsum(RMexp()), 1:10, 1:10, grid=FALSE)
##D RFfctn(RMsum(RMexp()), as.matrix(1:10), as.matrix(1:10), grid=FALSE)
## End(Not run)## End(Don't show)


## Don't show: 
FinalizeExample()
## End(Don't show)



