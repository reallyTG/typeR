library(RandomFields)


### Name: RMmodelsAdvanced
### Title: Advanced features of the models
### Aliases: RMmodelsAdvanced 'Advanced RMmodels'
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

## a non-stationary field with a sharp boundary
## of the differentiabilities
x <- seq(-0.6, 0.6, len=50)
model <- RMwhittle(nu=0.8 + 1.5 * R.is(R.p(new="isotropic"), "<=", 0.5))
z <- RFsimulate(model=model, x, x, n=4)
plot(z)
## Don't show: 
FinalizeExample()
## End(Don't show)


