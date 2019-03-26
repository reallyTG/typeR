library(polspline)


### Name: summary.lspec
### Title: Lspec: logspline estimation of a spectral distribution
### Aliases: summary.lspec print.lspec
### Keywords: ts smooth

### ** Examples

data(co2)
co2.detrend <- lm(co2~c(1:length(co2)))$residuals
fit <- lspec(co2.detrend)
summary(fit)



