library(drc)


### Name: boxcox.drc
### Title: Transform-both-sides Box-Cox transformation
### Aliases: boxcox.drc
### Keywords: models nonlinear

### ** Examples


## Fitting log-logistic model without transformation
ryegrass.m1 <- drm(ryegrass, fct = LL.4())
summary(ryegrass.m1)

## Fitting the same model with the optimal Box-Cox transformation
ryegrass.m2 <- boxcox(ryegrass.m1)
summary(ryegrass.m2)




