library(RandomFields)


### Name: Coins
### Title: Random coin method
### Aliases: Coins RPcoins Average RPaverage
### Keywords: methods

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again
## Don't show: ## Not run: 
##D x <- seq(0,25, 0.02)
##D model <- RPcoins(RMspheric())
##D z <- RFsimulate(model, x, x, spConform=FALSE) # takes 20 sec
##D Print(sd(as.vector(z)), mean(z))
##D image(z)
##D 
##D 
##D ### Gaussian field approximated by Poisson fields
##D x <- seq(0,10, 0.02)
##D for (intensity in c(1, 10, 100)) {
##D  z <- RFsimulate(x=x, model=RPcoins(RMspheric(), intensity = intensity))
##D  plot(z)
##D }
## End(Not run)## End(Don't show)

## Don't show: 
FinalizeExample()
## End(Don't show)


