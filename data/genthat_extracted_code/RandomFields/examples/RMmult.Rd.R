library(RandomFields)


### Name: RMmult
### Title: Multiplication of Random Field Models
### Aliases: RMmult * RM_MULT
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

# separable, multiplicative model
model <- RMgauss(proj=1) * RMexp(proj=2, scale=5)
z <- RFsimulate(model=model, 0:10, 0:10, n=4)
plot(z)

## Don't show: 
FinalizeExample()
## End(Don't show)


