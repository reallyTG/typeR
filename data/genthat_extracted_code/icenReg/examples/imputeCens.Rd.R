library(icenReg)


### Name: imputeCens
### Title: Impute Interval Censored Data from icenReg Regression Model
### Aliases: imputeCens

### ** Examples

simdata <- simIC_weib(n = 500)

fit <- ic_par(cbind(l, u) ~ x1 + x2,
              data = simdata)

imputedValues <- imputeCens(fit)



