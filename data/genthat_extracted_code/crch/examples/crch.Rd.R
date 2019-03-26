library(crch)


### Name: crch
### Title: Censored Regression with Conditional Heteroscedasticy
### Aliases: crch trch crch.fit
### Keywords: regression

### ** Examples

data("RainIbk")
## mean and standard deviation of square root transformed ensemble forecasts
RainIbk$sqrtensmean <- 
  apply(sqrt(RainIbk[,grep('^rainfc',names(RainIbk))]), 1, mean)
RainIbk$sqrtenssd <- 
  apply(sqrt(RainIbk[,grep('^rainfc',names(RainIbk))]), 1, sd)

## fit linear regression model with Gaussian distribution 
CRCH <- crch(sqrt(rain) ~ sqrtensmean, data = RainIbk, dist = "gaussian")
## same as lm?
all.equal(coef(lm(sqrt(rain) ~ sqrtensmean, data = RainIbk)),
  head(coef(CRCH), -1))

## print
CRCH
## summary
summary(CRCH)

## left censored regression model with censoring point 0:
CRCH2 <- crch(sqrt(rain) ~ sqrtensmean, data = RainIbk, 
  dist = "gaussian", left = 0)

## left censored regression model with censoring point 0 and 
## conditional heteroscedasticy:
CRCH3 <- crch(sqrt(rain) ~ sqrtensmean|sqrtenssd, data = RainIbk, 
  dist = "gaussian",  left = 0)

## left censored regression model with censoring point 0 and 
## conditional heteroscedasticy with logistic distribution:
CRCH4 <- crch(sqrt(rain) ~ sqrtensmean|sqrtenssd, data = RainIbk, 
  dist = "logistic", left = 0)

## compare AIC 
AIC(CRCH, CRCH2, CRCH3, CRCH4)



