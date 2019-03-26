library(dosresmeta)


### Name: waldtest
### Title: Wald Test for Model Coefficients
### Aliases: waldtest print.waldtest

### ** Examples

## Load data and run the model
data("alcohol_cvd")
model <- dosresmeta(formula = logrr ~ dose + I(dose^2), type = type, id = id,
                    se = se, cases = cases, n = n, data = alcohol_cvd) 
                    
## Test for significance of the overall dose-response association
waldtest(b = coef(model), Sigma = vcov(model), Terms = 1:nrow(vcov(model)))




