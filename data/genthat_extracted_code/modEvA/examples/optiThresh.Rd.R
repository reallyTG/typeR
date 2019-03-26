library(modEvA)


### Name: optiThresh
### Title: Optimize threshold for model evaluation.
### Aliases: optiThresh

### ** Examples

# load sample models:
data(rotif.mods)

# choose a particular model to play with:
mod <- rotif.mods$models[[1]]

optiThresh(model = mod)


# change some of the parameters:

optiThresh(model = mod, pch = 20, measures = c("CCR", "Sensitivity", 
"Specificity", "UPR", "OPR", "kappa", "TSS"), ylim = c(0, 1))


# you can also use optiThresh with vectors of observed and predicted values
# instead of with a model object:

optiThresh(obs = mod$y, pred = mod$fitted.values, pch = ".")



