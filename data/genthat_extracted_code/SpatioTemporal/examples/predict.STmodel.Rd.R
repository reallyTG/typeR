library(SpatioTemporal)


### Name: predict.STmodel
### Title: Computes Conditional Expectation at Unobserved Locations
### Aliases: predict.STmodel

### ** Examples

##load data
data(mesa.model)
data(est.mesa.model)

##find regression parameters using GLS
x.reg <- predict(mesa.model, est.mesa.model, only.pars = TRUE)
str(x.reg$pars)

## Not run: 
##D   ##compute predictions at all locations, including beta-fields
##D   pred.mesa.model <- predict(mesa.model, est.mesa.model,
##D                              pred.var=TRUE)
## End(Not run)
##Let's load precomputed results instead.
data(pred.mesa.model)

##study results
print(pred.mesa.model)



