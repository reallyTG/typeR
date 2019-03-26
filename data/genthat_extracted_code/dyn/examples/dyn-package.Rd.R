library(dyn)


### Name: dyn-package
### Title: Time Series Regression
### Aliases: dyn-package
### Keywords: models

### ** Examples

x <- ts(seq(10)^2)
dyn$lm(x ~ lag(x,-1))
dyn$glm(x ~ lag(x,-1))
dyn$loess(x ~ lag(x,-1))



