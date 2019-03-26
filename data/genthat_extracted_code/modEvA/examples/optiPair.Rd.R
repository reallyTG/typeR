library(modEvA)


### Name: optiPair
### Title: Optimize the discrimination threshold for a pair of related
###   model evaluation measures.
### Aliases: optiPair

### ** Examples

# load sample models:
data(rotif.mods)

# choose a particular model to play with:
mod <- rotif.mods$models[[1]]

optiPair(model = mod)

optiPair(model = mod, measures = c("UPR", "OPR"))


# you can also use optiPair with vectors of observed and predicted values
# instead of with a model object:

optiPair(obs = mod$y, pred = mod$fitted.values, 
measures = c("UPR", "OPR"))



