library(drc)


### Name: rdrm
### Title: Simulating a dose-response curve
### Aliases: rdrm
### Keywords: models nonlinear

### ** Examples


## Simulating normally distributed dose-response data

## Model fit to simulate from
ryegrass.m1 <- drm(rootl~conc, data = ryegrass, fct = LL.4())

## 10 random dose-response curves based on the model fit
sim10a <- rdrm(10, LL.4(), coef(ryegrass.m1), xerror = ryegrass$conc)
sim10a


## Simulating binomial dose-response data

## Model fit to simulate from
deguelin.m1 <- drm(r/n~dose, weights=n, data=deguelin, fct=LL.2(), type="binomial")

## 10 random dose-response curves
sim10b <- rdrm(10, LL.2(), coef(deguelin.m1), deguelin$dose, yerror="rbinom", ypar=deguelin$n)
sim10b




