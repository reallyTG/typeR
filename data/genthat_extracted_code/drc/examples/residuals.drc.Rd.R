library(drc)


### Name: residuals.drc
### Title: Extracting residuals from the fitted dose-response model
### Aliases: residuals.drc
### Keywords: models nonlinear

### ** Examples


## Fitting a four-parameter log-logistic model
ryegrass.m1 <- drm(rootl ~conc, data = ryegrass, fct = LL.4())

## Displaying the residual plot (raw residuals)
plot(fitted(ryegrass.m1), residuals(ryegrass.m1))

## Using the standardised residuals
plot(fitted(ryegrass.m1), residuals(ryegrass.m1, typeRes = "standard"))

## Overlayering the studentised residuals ... not much of a difference
points(fitted(ryegrass.m1), residuals(ryegrass.m1, typeRes = "student"), col = 2)




