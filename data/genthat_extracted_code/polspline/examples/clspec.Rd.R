library(polspline)


### Name: clspec
### Title: Lspec: logspline estimation of a spectral distribution
### Aliases: clspec dlspec plspec rlspec
### Keywords: ts smooth

### ** Examples

data(co2)
co2.detrend <- lm(co2~c(1:length(co2)))$residuals
fit <- lspec(co2.detrend)
clspec(0:12,fit)
plspec((0:314)/100, fit)
dlspec((0:314)/100, fit)
rlspec(length(co2),fit)



