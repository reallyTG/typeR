library(dosresmeta)


### Name: coef.dosresmeta
### Title: Extract Coefficients and (Co)Variance Matrix from dosresmeta
###   Objects
### Aliases: coef.dosresmeta vcov.dosresmeta

### ** Examples

## Load data and run the model
data("alcohol_cvd")
model <- dosresmeta(formula = logrr ~ dose + I(dose^2), type = type, id = id,
                   se = se, cases = cases, n = n, data = alcohol_cvd) 

## Fixed-effect coefficients
coef(model)

## Fixed-effect (co)variance matrix
vcov(model)





