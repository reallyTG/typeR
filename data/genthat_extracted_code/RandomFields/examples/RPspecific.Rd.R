library(RandomFields)


### Name: Specific
### Title: Methods that are specific to certain covariance models
### Aliases: Specific RPspecific
### Keywords: methods

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

## example for implicit use
model <- RMgauss(var=10, s=10) + RMnugget(var=0.1)
plot(model)
plot(RFsimulate(model=model, 0:10, 0:10, n=4))
## The following function shows the internal structure of the model.
## In particular, it can be seen that RPspecific is applied to RMplus.
RFgetModelInfo(level=0, which="internal")

## example for explicit use: every simulation has a different variance
model <- RPspecific(RMS(var=unif(min=0, max=100), RMgauss()))
x <- seq(0,50,0.02)
plot(RFsimulate(model, x=x, n=4), ylim=c(-15,15))

## Don't show: 
FinalizeExample()
## End(Don't show)


