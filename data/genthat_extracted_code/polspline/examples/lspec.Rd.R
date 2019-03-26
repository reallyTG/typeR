library(polspline)


### Name: lspec
### Title: Lspec: logspline estimation of a spectral distribution
### Aliases: lspec
### Keywords: ts smooth

### ** Examples

data(co2)
co2.detrend <- unstrip(lm(co2~c(1:length(co2)))$residuals)
fit <- lspec(co2.detrend)



