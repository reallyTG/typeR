library(drc)


### Name: AR
### Title: Asymptotic regression model
### Aliases: AR.2 AR.3
### Keywords: models nonlinear

### ** Examples


## First model
met.as.m1<-drm(gain ~ dose, product, data = methionine, fct = AR.3(), 
pmodels = list(~1, ~factor(product), ~factor(product)))
plot(met.as.m1, log = "", ylim = c(1450, 1800))
summary(met.as.m1)

## Calculating bioefficacy: approach 1
coef(met.as.m1)[5] / coef(met.as.m1)[4] * 100

## Calculating bioefficacy: approach 2
EDcomp(met.as.m1, c(50,50))

## Simplified models
met.as.m2<-drm(gain ~ dose, product, data = methionine, fct = AR.3(), 
pmodels = list(~1, ~1, ~factor(product)))
anova(met.as.m2, met.as.m1)  # simplification not possible

met.as.m3 <- drm(gain ~ dose, product, data = methionine, fct = AR.3(), 
pmodels = list(~1, ~factor(product), ~1))
anova(met.as.m3, met.as.m1)  # simplification not possible




