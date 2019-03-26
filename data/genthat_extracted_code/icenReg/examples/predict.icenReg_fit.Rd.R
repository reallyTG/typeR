library(icenReg)


### Name: predict.icenReg_fit
### Title: Predictions from icenReg Regression Model
### Aliases: predict.icenReg_fit

### ** Examples

simdata <- simIC_weib(n = 500, b1 = .3, b2 = -.3,
                      inspections = 6,
                      inspectLength = 1)

fit <- ic_par(cbind(l, u) ~ x1 + x2,
              data = simdata)

imputedValues <- predict(fit)



