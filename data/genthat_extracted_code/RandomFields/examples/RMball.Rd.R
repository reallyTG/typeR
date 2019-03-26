library(RandomFields)


### Name: RMball
### Title: RMball
### Aliases: RMball
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

x <- seq(0,10,len=100)
model <- RMball(var=2,scale=1.5)
plot(model)
z <- RFsimulate(RPpoisson(model),x=x,y=x,intensity=0.1)
plot(z)

## Don't show: ## Not run: 
##D model <- RPcoins(shape=RMball())
##D x <- seq(0, 10, 0.02)
##D plot(RFsimulate(model, x=x))
## End(Not run)## End(Don't show)
## Don't show: 
FinalizeExample()
## End(Don't show)


