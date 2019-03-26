library(modEvA)


### Name: plotGLM
### Title: Plot a generalized linear model
### Aliases: plotGLM

### ** Examples

# load sample models:
data(rotif.mods)

# choose a particular model to play with:
mod <- rotif.mods$models[[1]]

plotGLM(model = mod)

plotGLM(model = mod, plot.values = FALSE)


# you can also use \code{plotGLM} with vectors of observed and predicted values
# instead of with a model object:

plotGLM(obs = mod$y, pred = mod$fitted.values)



