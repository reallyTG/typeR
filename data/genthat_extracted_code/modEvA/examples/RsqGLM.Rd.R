library(modEvA)


### Name: RsqGLM
### Title: R-squared measures for GLMs
### Aliases: RsqGLM

### ** Examples

# load sample models:
data(rotif.mods)

# choose a particular model to play with:
mod <- rotif.mods$models[[1]]

RsqGLM(model = mod)


# you can also use RsqGLM with vectors of observed and predicted values
# instead of a model object:

RsqGLM(obs = mod$y, pred = mod$fitted.values)



