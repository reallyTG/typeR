library(RandomFields)


### Name: Spectral
### Title: Spectral turning bands method
### Aliases: Spectral RPspectral
### Keywords: methods

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

model <- RPspectral(RMmatern(nu=1))
y <- x <- seq(0,10, len=400)
z <- RFsimulate(model, x, y, n=2)
plot(z)
## Don't show: 
FinalizeExample()
## End(Don't show)


