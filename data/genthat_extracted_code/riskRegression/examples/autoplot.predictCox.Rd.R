library(riskRegression)


### Name: autoplot.predictCox
### Title: Plot Predictions From a Cox Model
### Aliases: autoplot.predictCox

### ** Examples

library(survival)
library(ggplot2)

#### simulate data ####
set.seed(10)
d <- sampleData(1e2, outcome = "survival")

#### Cox model ####
m.cox <- coxph(Surv(time,event)~ X1 + X2 + X3,
                data = d, x = TRUE, y = TRUE)

## display baseline hazard
e.basehaz <- predictCox(m.cox)

autoplot(e.basehaz, type = "cumhazard")

## display predicted survival
pred.cox <- predictCox(m.cox, newdata = d[1:4,],
  times = 1:5, type = "survival", keep.newdata = TRUE)
autoplot(pred.cox)
autoplot(pred.cox, group.by = "covariates")
autoplot(pred.cox, group.by = "covariates", reduce.data = TRUE)

## predictions with confidence interval/bands
pred.cox <- predictCox(m.cox, newdata = d[1,,drop=FALSE],
  times = 1:5, type = "survival", band = TRUE, se = TRUE, keep.newdata = TRUE)
autoplot(pred.cox, ci = TRUE, band = TRUE)
autoplot(pred.cox, ci = TRUE, band = TRUE, alpha = 0.1)

#### Stratified Cox model ####
m.cox.strata <- coxph(Surv(time,event)~ strata(X1) + strata(X2) + X3 + X6,
                      data = d, x = TRUE, y = TRUE)

pred.cox.strata <- predictCox(m.cox.strata, newdata = d[1:5,,drop=FALSE],
                              time = 1:5, keep.newdata = TRUE)

## display
res <- autoplot(pred.cox.strata, type = "survival", group.by = "strata")

## customize display
res$plot + facet_wrap(~strata, labeller = label_both)
res$plot %+% res$data[strata == "0, 1"]



