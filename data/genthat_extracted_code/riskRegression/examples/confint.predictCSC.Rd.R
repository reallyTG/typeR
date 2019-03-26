library(riskRegression)


### Name: confint.predictCSC
### Title: Confidence Intervals and Confidence Bands for the Predicted
###   Absolute Risk (Cumulative Incidence Function)
### Aliases: confint.predictCSC

### ** Examples

library(survival)

#### generate data ####
set.seed(10)
d <- sampleData(100) 

#### estimate a stratified CSC model ###
fit <- CSC(Hist(time,event)~ X1 + strata(X2) + X6, data=d)

#### compute individual specific risks
fit.pred <- predict(fit, newdata=d[1:3], times=c(3,8), cause = 1,
                    se = TRUE, iid = TRUE, band = TRUE)
fit.pred

## check confidence intervals
newse <- fit.pred$absRisk.se/(-fit.pred$absRisk*log(fit.pred$absRisk))
cbind(lower = as.double(exp(-exp(log(-log(fit.pred$absRisk)) + 1.96 * newse))),
      upper = as.double(exp(-exp(log(-log(fit.pred$absRisk)) - 1.96 * newse)))
)

#### compute confidence intervals without transformation
confint(fit.pred, absRisk.transform = "none")
cbind(lower = as.double(fit.pred$absRisk - 1.96 * fit.pred$absRisk.se),
      upper = as.double(fit.pred$absRisk + 1.96 * fit.pred$absRisk.se)
)





