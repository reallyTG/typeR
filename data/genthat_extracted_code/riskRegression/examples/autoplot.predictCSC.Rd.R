library(riskRegression)


### Name: autoplot.predictCSC
### Title: Plot Predictions From a Cause-specific Cox Proportional Hazard
###   Regression
### Aliases: autoplot.predictCSC

### ** Examples

library(survival)
library(rms)

#### simulate data ####
set.seed(10)
d <- sampleData(1e2, outcome = "competing.risks")

#### CSC model ####
m.CSC <- CSC(Hist(time,event)~ X1 + X2 + X6, data = d)

pred.CSC <- predict(m.CSC, newdata = d[1:2,], time = 1:5, cause = 1)#'
autoplot(pred.CSC)


#### stratified CSC model ####
m.SCSC <- CSC(Hist(time,event)~ strata(X1) + strata(X2) + X6,
              data = d)
pred.SCSC <- predict(m.SCSC, time = 1:3, newdata = d[1:4,],
                     cause = 1, keep.newdata = TRUE, keep.strata = TRUE)
autoplot(pred.SCSC, group.by = "strata")



