library(hdnom)


### Name: hdnom.calibrate
### Title: Calibrate High-Dimensional Cox Models
### Aliases: hdnom.calibrate

### ** Examples

library("survival")

# Load imputed SMART data
data("smart")
x = as.matrix(smart[, -c(1, 2)])
time = smart$TEVENT
event = smart$EVENT
y = Surv(time, event)

# Fit Cox model with lasso penalty
fit = hdcox.lasso(x, y, nfolds = 5, rule = "lambda.1se", seed = 11)

# Model calibration by fitting the original data directly
cal.fitting = hdnom.calibrate(
  x, time, event, model.type = "lasso",
  alpha = 1, lambda = fit$lasso_best_lambda,
  method = "fitting",
  pred.at = 365 * 9, ngroup = 5,
  seed = 1010)

# Model calibration by 5-fold cross-validation
cal.cv = hdnom.calibrate(
  x, time, event, model.type = "lasso",
  alpha = 1, lambda = fit$lasso_best_lambda,
  method = "cv", nfolds = 5,
  pred.at = 365 * 9, ngroup = 5,
  seed = 1010)

print(cal.fitting)
summary(cal.fitting)
plot(cal.fitting)

print(cal.cv)
summary(cal.cv)
plot(cal.cv)



