library(RandomFields)


### Name: RMmqam
### Title: multivariate quasi-arithmetic mean
### Aliases: RMmqam RMmqam
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

RFoptions(modus_operandi="sloppy")
model <- RMmqam(phi=RMgauss(),RMgauss(),RMexp(),theta=c(0.4, 0.6), scale=0.5)
x <- seq(0, 10, 0.02)
plot(model)
z <- RFsimulate(model=model, x=x)
plot(z)

RFoptions(modus_operandi="normal")
## Don't show: 
FinalizeExample()
## End(Don't show)


