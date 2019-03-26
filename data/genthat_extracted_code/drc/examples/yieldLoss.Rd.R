library(drc)


### Name: yieldLoss
### Title: Calculating yield loss parameters
### Aliases: yieldLoss
### Keywords: models nonlinear

### ** Examples


## Fitting Michaelis-Menten model
met.mm.m1 <- drm(gain~dose, product, data = methionine, fct = MM.3(), 
pmodels = list(~1, ~factor(product), ~factor(product)))

## Yield loss parameters with standard errrors
yieldLoss(met.mm.m1)

## Also showing confidence intervals
yieldLoss(met.mm.m1, "as")




