library(drc)


### Name: MM
### Title: Michaelis-Menten model
### Aliases: MM.2 MM.3
### Keywords: models nonlinear

### ** Examples


## Fitting Michaelis-Menten model
met.mm.m1 <- drm(gain~dose, product, data=methionine, fct=MM.3(), 
pmodels = list(~1, ~factor(product), ~factor(product)))
plot(met.mm.m1, log = "", ylim=c(1450, 1800))
summary(met.mm.m1)
ED(met.mm.m1, c(10, 50))

## Calculating bioefficacy: approach 1
coef(met.mm.m1)[4] / coef(met.mm.m1)[5] * 100

## Calculating bioefficacy: approach 2
EDcomp(met.mm.m1, c(50,50))

## Simplified models
met.mm.m2a <- drm(gain~dose, product, data=methionine, fct=MM.3(), 
pmodels = list(~1, ~factor(product), ~1))
anova(met.mm.m2a, met.mm.m1)  # model reduction not possible

met.mm.m2b <- drm(gain~dose, product, data=methionine, fct=MM.3(), 
pmodels = list(~1, ~1, ~factor(product)))
anova(met.mm.m2b, met.mm.m1)  # model reduction not possible




