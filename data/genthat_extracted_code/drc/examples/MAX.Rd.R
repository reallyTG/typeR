library(drc)


### Name: MAX
### Title: Maximum mean response
### Aliases: MAX
### Keywords: models nonlinear

### ** Examples


## Fitting a Cedergreen-Ritz-Streibig model
lettuce.m1 <- drm(weight~conc, data = lettuce, fct = CRS.4c())

## Finding maximum average response and the corrresponding dose
MAX(lettuce.m1)




