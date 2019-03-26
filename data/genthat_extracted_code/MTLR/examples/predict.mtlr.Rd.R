library(MTLR)


### Name: predict.mtlr
### Title: Predictions for MTLR
### Aliases: predict.mtlr

### ** Examples

library(survival)
mod <- mtlr(Surv(time,status)~., data = lung)

#Here our predictions are on the data from which we trained so our results will be optimistic
# since they are produced from resubstitution as opposed to some new test set.
predict(mod, type = "survivalcurve")
predict(mod, type = "prob_event")
predict(mod, type = "median_time")
predict(mod, type = "mean_time")

#Notice the difference of about 59:
predict(mod, type = "mean_time", add_zero = FALSE)



