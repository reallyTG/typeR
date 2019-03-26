library(modEvA)


### Name: AUC
### Title: Area Under the ROC Curve
### Aliases: AUC

### ** Examples

# load sample models:
data(rotif.mods)

# choose a particular model to play with:
mod <- rotif.mods$models[[1]]


AUC(model = mod, simplif = TRUE)

AUC(model = mod)

AUC(model = mod, grid = TRUE, plot.preds = TRUE)


# you can also use AUC with vectors of observed and predicted values
# instead of with a model object:

presabs <- mod$y
prediction <- mod$fitted.values

AUC(obs = presabs, pred = prediction)



