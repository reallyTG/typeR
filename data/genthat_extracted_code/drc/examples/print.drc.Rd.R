library(drc)


### Name: print.drc
### Title: Printing key features
### Aliases: print.drc
### Keywords: models nonlinear

### ** Examples


## Fitting a four-parameter log-logistic model
ryegrass.m1 <- drm(rootl ~conc, data = ryegrass, fct = LL.4())

## Displaying the model fit
print(ryegrass.m1)
ryegrass.m1  # gives the same output as the previous line




