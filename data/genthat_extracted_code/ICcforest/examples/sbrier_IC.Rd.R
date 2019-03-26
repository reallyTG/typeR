library(ICcforest)


### Name: sbrier_IC
### Title: Model Fit For Interval-Censored Data
### Aliases: sbrier_IC
### Keywords: Brier integrated score score,

### ** Examples

### Example with dataset miceData
library(survival)
library(icenReg)
data(miceData)

## For proper evaluation, Inf should be set to be a large number, for example, 9999999.
idx_inf <- (miceData$u == Inf)
miceData$u[idx_inf] <- 9999999.

obj <- Surv(miceData$l, miceData$u, type = "interval2")

## Model fit for an NPMLE survival curve with survfit
pred <- survival::survfit(formula = Surv(l, u, type = "interval2") ~ 1, data = miceData)
# Integrated Brier score up to time = 642
sbrier_IC(obj, pred, btime = c(0, 642), type = "IBS")

## Model fit for a semi-parametric model with icenReg::ic_sp()
pred <- icenReg::ic_sp(formula = Surv(l, u, type = "interval2") ~ 1, data = miceData)
# Integrated Brier score up to the largest endpoints of all censoring intervals in the dataset
sbrier_IC(obj, pred, type = "IBS")

## Model fit for an NPMLE survival curve with icenReg::ic_np()
pred <- icenReg::ic_np(miceData[,c('l', 'u')])
# Brier score computed at every left and right endpoints of all censoring intervals in the dataset
sbrier_IC(obj, pred, type = "BS")






