library(riskRegression)


### Name: predictCoxPL
### Title: Computation of survival probabilities from Cox regression models
###   using the product limit estimator.
### Aliases: predictCoxPL

### ** Examples

library(survival)

#### generate data ####
set.seed(10)
d <- sampleData(40,outcome="survival")
nd <- sampleData(4,outcome="survival")
d$time <- round(d$time,1)

#### Cox model ####
fit <- coxph(Surv(time,event)~ X1 + X2 + X6,
             data=d, ties="breslow", x = TRUE, y = TRUE)

## exponential approximation
predictCox(fit, newdata = d, times = 1:5)

## product limit
predictCoxPL(fit, newdata = d, times = 1:5)

#### stratified Cox model ####
fitS <- coxph(Surv(time,event)~ X1 + strata(X2) + X6,
             data=d, ties="breslow", x = TRUE, y = TRUE)

## exponential approximation
predictCox(fitS, newdata = d, times = 1:5)

## product limit
predictCoxPL(fitS, newdata = d, times = 1:5)

#### fully stratified Cox model ####
fitS <- coxph(Surv(time,event)~ 1,
             data=d, ties="breslow", x = TRUE, y = TRUE)

## product limit
GS <- survfit(Surv(time,event)~1, data = d)
range(predictCoxPL(fitS)$survival - GS$surv)

fitS <- coxph(Surv(time,event)~ strata(X2),
             data=d, ties="breslow", x = TRUE, y = TRUE)

## product limit
GS <- survfit(Surv(time,event)~X2, data = d)
range(predictCoxPL(fitS)$survival - GS$surv)




