library(RandomFields)


### Name: Hierarchical Modelling
### Title: Bayesian Spatial Modelling
### Aliases: Bayesian bayesian 'Bayesian Modelling' Hierarchical
###   'Hierarchical Modelling'
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again
## See 'RRmodels' for hierarchical models

## the following model defines the argument nu of the Whittle-Matern
## model to be an exponential random variable with rate 5.
model <- ~ 1 + RMwhittle(scale=NA, var=NA, nu=exp(rate=5)) + RMnugget(var=NA)
## Don't show: 
if (!interactive()) model <- 1 + RMwhittle(scale=NA, var=NA, nu=exp(rate=5))
## End(Don't show)
data(soil)
fit <- RFfit(model, x=soil$x, y=soil$y, data=soil$moisture, modus="careless")
print(fit)
## Don't show: 
FinalizeExample()
## End(Don't show)


