library(dosresmeta)


### Name: print.dosresmeta
### Title: Summarizing dosresmeta Models
### Aliases: print.dosresmeta summary.dosresmeta print.summary.dosresmeta

### ** Examples

## Load data and run the model
data("alcohol_cvd")
model <- dosresmeta(formula = logrr ~ dose + I(dose^2), type = type, id = id,
                    se = se, cases = cases, n = n, data = alcohol_cvd) 
## Defult print
model
## Specify digits
print(model, digit = 2)
## summary with 90th confidence intervals
summary(model, ci.level = .8)




