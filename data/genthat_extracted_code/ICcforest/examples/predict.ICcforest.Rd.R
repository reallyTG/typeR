library(ICcforest)


### Name: predict.ICcforest
### Title: Predict from an ICcforest model
### Aliases: predict.ICcforest

### ** Examples

library(icenReg)
data(miceData)

## For ICcforest to run, Inf should be set to be a large number, for example, 9999999.
miceData$u[miceData$u == Inf] <- 9999999.

## First, fit an iterval-censored conditional inference forest
Cforest <- ICcforest(formula = Surv(l,u,type="interval2")~grp, data = miceData)
## Predict the survival function constructed using the non-parametric maximum likelihood estimator
Pred <- predict(Cforest, type = "prob")

## Out-of-bag prediction of the median survival time
PredOOB <- predict(Cforest, type = "response", OOB = TRUE)




