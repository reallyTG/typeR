library(RandomFields)


### Name: RMmodel
### Title: Covariance and Variogram Models in 'RandomFields' (RM commands)
### Aliases: RMmodel RMmodels [,RMmodel,ANY,ANY-method
###   [<-,RMmodel,ANY,ANY-method
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

## an example of a simple model
model <- RMexp(var=1.6, scale=0.5) + RMnugget(var=0) #exponential + nugget
plot(model)

## Don't show: 
FinalizeExample()
## End(Don't show)


