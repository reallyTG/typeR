library(RandomFields)


### Name: RMconstant
### Title: Covariance Matrix Constant in Space
### Aliases: RMconstant RMconstant
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

model <- RMconstant(diag(2),var=3)
plot(model)
x <- seq(0,10,length=100)
z <- RFsimulate(model=model,x=x)

## Don't show: 
FinalizeExample()
## End(Don't show)


