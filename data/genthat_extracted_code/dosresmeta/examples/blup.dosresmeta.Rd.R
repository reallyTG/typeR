library(dosresmeta)


### Name: blup.dosresmeta
### Title: Best Linear Unbiased Predictions from dosresmeta Models
### Aliases: blup.dosresmeta

### ** Examples

## Load data and run the linear and quadratic models
data("alcohol_cvd")
lin <- dosresmeta(formula = logrr ~ dose, type = type, id = id,
                  se = se, cases = cases, n = n, data = alcohol_cvd) 
quadr <- dosresmeta(formula = logrr ~ dose + I(dose^2), type = type, id = id,
                    se = se, cases = cases, n = n, data = alcohol_cvd) 

## blup prediction for the previous models
blup(lin)
blup(quadr)




