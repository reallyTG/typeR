library(dosresmeta)


### Name: dosresmeta.ml
### Title: ML and REML Estimators for dosresmeta Models
### Aliases: dosresmeta.ml dosresmeta.reml

### ** Examples


data("alcohol_cvd")

## Random-effect dose-response model assuming linearity, ML estimator
lin.ml <- dosresmeta(formula = logrr ~ dose, type = type, id = id,
                     se = se, cases = cases, n = n, data = alcohol_cvd,
                     , method = "ml")
summary(lin.ml)

## Random-effect dose-response model assuming linearity, REML estimator
lin.reml <- dosresmeta(formula = logrr ~ dose, type = type, id = id,
                       se = se, cases = cases, n = n, data = alcohol_cvd,
                       , method = "reml")
summary(lin.reml)




