library(dosresmeta)


### Name: fracpol
### Title: Fractional Polynomials
### Aliases: fracpol

### ** Examples

## Load data and run the model
data("alcohol_cvd")

with(alcohol_cvd, fracpol(dose, p = c(.5, .5)))

model <- dosresmeta(formula = logrr ~ fracpol(dose, p = c(.5, .5)), type = type, id = id,
                    se = se, cases = cases, n = n, data = alcohol_cvd) 
                    
## Test for significance of the overall dose-response association
waldtest(b = coef(model), Sigma = vcov(model), Terms = 1:nrow(vcov(model)))




