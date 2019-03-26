library(RandomFields)


### Name: Brown-Resnick-Specific
### Title: Simulation methods for Brown-Resnick processes
### Aliases: BRmethods RPbrmixed RPbrorig RPbrshifted RPloggaussnormed
### Keywords: methods

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
#
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

## currently does not work

## Don't show: ## Not run: 
##D model <- RPbrshifted(RMfbm(alpha=1.5), xi=0)
##D x <- 0:10
##D z <- RFsimulate(model=model, x=x, y=x, n=4)
##D plot(z)
## End(Not run)## End(Don't show)

## Don't show: 
FinalizeExample()
## End(Don't show)




