library(hdnom)


### Name: hdnom.validate
### Title: Validate High-Dimensional Cox Models with Time-Dependent AUC
### Aliases: hdnom.validate

### ** Examples

library("survival")

# Load imputed SMART data
data(smart)
x = as.matrix(smart[, -c(1, 2)])[1:500, ]
time = smart$TEVENT[1:500]
event = smart$EVENT[1:500]
y = Surv(time, event)

# Fit penalized Cox model with lasso penalty
fit = hdcox.lasso(x, y, nfolds = 5, rule = "lambda.1se", seed = 11)

# Model validation by bootstrap with time-dependent AUC
# Normally boot.times should be set to 200 or more,
# we set it to 3 here only to save example running time.
val.boot = hdnom.validate(
  x, time, event, model.type = "lasso",
  alpha = 1, lambda = fit$lasso_best_lambda,
  method = "bootstrap", boot.times = 3,
  tauc.type = "UNO", tauc.time = seq(0.25, 2, 0.25) * 365,
  seed = 1010)

# Model validation by 5-fold cross-validation with time-dependent AUC
val.cv = hdnom.validate(
  x, time, event, model.type = "lasso",
  alpha = 1, lambda = fit$lasso_best_lambda,
  method = "cv", nfolds = 5,
  tauc.type = "UNO", tauc.time = seq(0.25, 2, 0.25) * 365,
  seed = 1010)

# Model validation by repeated cross-validation with time-dependent AUC
val.repcv = hdnom.validate(
  x, time, event, model.type = "lasso",
  alpha = 1, lambda = fit$lasso_best_lambda,
  method = "repeated.cv", nfolds = 5, rep.times = 3,
  tauc.type = "UNO", tauc.time = seq(0.25, 2, 0.25) * 365,
  seed = 1010)

# bootstrap-based discrimination curves has a very narrow band
print(val.boot)
summary(val.boot)
plot(val.boot)

# k-fold cv provides a more strict evaluation than bootstrap
print(val.cv)
summary(val.cv)
plot(val.cv)

# repeated cv provides similar results as k-fold cv
# but more robust than k-fold cv
print(val.repcv)
summary(val.repcv)
plot(val.repcv)



