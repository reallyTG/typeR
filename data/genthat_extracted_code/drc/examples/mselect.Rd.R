library(drc)


### Name: mselect
### Title: Dose-response model selection
### Aliases: mselect
### Keywords: models nonlinear

### ** Examples


### Example with continuous/quantitative data
## Fitting initial four-parameter log-logistic model
ryegrass.m1 <- drm(rootl ~ conc, data = ryegrass, fct = LL.4())

## Model selection
mselect(ryegrass.m1, list(LL.3(), LL.5(), W1.3(), W1.4(), W2.4(), baro5()))

## Model selection including linear, quadratic, and cubic regression models
mselect(ryegrass.m1, list(LL.3(), LL.5(), W1.3(), W1.4(), W2.4(), baro5()), linreg = TRUE)

## Comparing nested models
mselect(ryegrass.m1, list(LL.5()), nested = TRUE)

### Example with quantal data
## Fitting initial two-parameter log-logistic model
earthworms.m1 <- drm(number/total~dose, weights=total, 
data = earthworms, fct = LL.2(), type = "binomial")

## Comparing 4 models
mselect(earthworms.m1, list(W1.2(), W2.2(), LL.3()))





