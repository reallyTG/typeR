library(RandomFields)


### Name: RMschlather
### Title: Covariance Model for binary field based on Gaussian field
### Aliases: RMschlather
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

## This example considers an extremal Gaussian random field
## with Gneiting's correlation function.

## first consider the covariance model and its corresponding tail
## correlation function
model <- RMgneiting()
plot(model, model.tail.corr.fct=RMschlather(model),  xlim=c(0, 5))


## the extremal Gaussian field with the above underlying
## correlation function that has the above tail correlation function
x <- seq(0, 10, 0.1)
z <- RFsimulate(RPschlather(model), x)
plot(z)

## Note that in RFsimulate R-P-schlather was called, not R-M-schlather.
## The following lines give a Gaussian random field with correlation
## function equal to the above tail correlation function.
z <- RFsimulate(RMschlather(model), x)
plot(z)


## Don't show: 
FinalizeExample()
## End(Don't show)


