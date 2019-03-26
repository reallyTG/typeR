library(forecast)


### Name: CV
### Title: Cross-validation statistic
### Aliases: CV
### Keywords: models

### ** Examples


y <- ts(rnorm(120,0,3) + 20*sin(2*pi*(1:120)/12), frequency=12)
fit1 <- tslm(y ~ trend + season)
fit2 <- tslm(y ~ season)
CV(fit1)
CV(fit2)




