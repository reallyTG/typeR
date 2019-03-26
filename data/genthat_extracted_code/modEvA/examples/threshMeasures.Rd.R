library(modEvA)


### Name: threshMeasures
### Title: Threshold-based measures of model evaluation
### Aliases: threshMeasures

### ** Examples

# load sample models:
data(rotif.mods)

# choose a particular model to play with:
mod <- rotif.mods$models[[1]]

threshMeasures(model = mod, simplif = TRUE, thresh = 0.5)

threshMeasures(model = mod, thresh = "preval")

threshMeasures(model = mod, plot.ordered = TRUE, thresh = "preval")

threshMeasures(model = mod, measures = c("CCR", "TSS", "kappa"), 
thresh = "preval")

threshMeasures(model = mod, plot.ordered = TRUE, thresh = "preval")


# you can also use threshMeasures with vectors of observed and predicted values
# instead of with a model object:

threshMeasures(obs = mod$y, pred = mod$fitted.values, thresh = "preval")



