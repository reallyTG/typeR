library(drc)


### Name: update.drc
### Title: Updating and re-fitting a model
### Aliases: update.drc
### Keywords: models nonlinear

### ** Examples


## Fitting a four-parameter Weibull model
model1 <- drm(ryegrass, fct = W1.4())

## Updating 'model1' by fitting a three-parameter Weibull model instead
model2 <- update(model1, fct = W1.3())
anova(model2, model1)





