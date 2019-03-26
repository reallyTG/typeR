library(drc)


### Name: weibull1
### Title: Weibull model functions
### Aliases: weibull1 weibull2 weibull2x
### Keywords: models nonlinear

### ** Examples


## Fitting two different Weibull models
ryegrass.m1 <- drm(ryegrass, fct = W1.4())
plot(ryegrass.m1, conLevel=0.5)

ryegrass.m2 <- drm(ryegrass, fct = W2.4())
plot(ryegrass.m2, conLevel=0.5, add = TRUE, type = "none", col = 2)
# you could also look at the ED values to see the difference

## A four-parameter Weibull model with b fixed at 1
ryegrass.m3 <- drm(ryegrass, fct = W1.4(fixed = c(1, NA, NA, NA)))
summary(ryegrass.m3)

## A four-parameter Weibull model with the constraint b>3
ryegrass.m4 <- drm(ryegrass, fct = W1.4(), lowerl = c(3, -Inf, -Inf, -Inf), 
control = drmc(constr=TRUE))
summary(ryegrass.m4)




