library(RandomFields)


### Name: RMpolygon
### Title: RMpolygon
### Aliases: RMpolygon
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

## Don't show: ## Not run: 
##D model <- RPcoins(shape=RMpolygon())
##D x <- seq(0, 10, 0.02)
##D plot(RFsimulate(model, x=x))
## End(Not run)## End(Don't show)
## Don't show: 
FinalizeExample()
## End(Don't show)


