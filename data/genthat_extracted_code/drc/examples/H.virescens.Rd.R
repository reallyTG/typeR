library(drc)


### Name: H.virescens
### Title: Mortality of tobacco budworms
### Aliases: H.virescens
### Keywords: datasets

### ** Examples


## Fitting dose-response model (log-logistic with common slope)
Hv.m1 <- drm(numdead/total~dose, sex, weights = total, data = H.virescens, fct = LL.2(), 
pmodels = list(~ 1, ~ sex - 1), type = "binomial")
summary(Hv.m1)

## Fitting the same model as in Venables and Riply (2002)
Hv.m2 <- glm(cbind(numdead, total-numdead) ~ sex + I(log2(dose)) - 1, data = H.virescens, 
family = binomial)

## Comparing the fits
logLik(Hv.m1)
logLik(Hv.m2)

## Estimated ED values (matching those given in MASS)
ED(Hv.m1, c(25, 50, 75))





