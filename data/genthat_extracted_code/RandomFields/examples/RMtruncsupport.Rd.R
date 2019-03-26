library(RandomFields)


### Name: RMtruncsupport
### Title: Truncating the Support of a Shape Function
### Aliases: RMtruncsupport
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again 

model <- RMgauss()
model1 <- RMtruncsupport(model, radius=1)
plot(model)
lines(model1, col="red")

## For a real application of 'RMtruncsupport' see example 2 of 'RPpoisson'.

## Don't show: ## Not run: 
##D model <- RPcoins(shape = RMtruncsupport(RMgauss(), radius=1.5), intensity=1)
##D x <- seq(0, 10, 0.02)
##D plot(RFsimulate(model, x=x))
## End(Not run)## End(Don't show)
## Don't show: 
FinalizeExample()
## End(Don't show)


