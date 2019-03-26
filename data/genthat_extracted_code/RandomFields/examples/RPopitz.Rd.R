library(RandomFields)


### Name: Extremal t
### Title: Extremal t process
### Aliases: RPopitz 'extremal t' 'extremal t process'
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)

## sorry, does not work savely yet

## Don't show: ## Not run: 
##D RFoptions(seed=0, xi=0)
##D ## seed=0: *ANY* simulation will have the random xseed 0; set
##D ##         RFoptions(seed=NA) to make them all random again
##D ## xi=0: any simulated max-stable random field has extreme value index 0
##D x <- seq(0, 2, 0.01)
##D model <- RPopitz(RMgauss(), alpha=2)
##D z1 <- RFsimulate(model, x)
##D plot(z1, type="l")
##D 
## End(Not run)## End(Don't show)

## Don't show: 
FinalizeExample()
## End(Don't show)


