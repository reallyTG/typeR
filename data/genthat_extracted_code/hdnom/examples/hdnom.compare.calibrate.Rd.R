library(hdnom)


### Name: hdnom.compare.calibrate
### Title: Compare High-Dimensional Cox Models by Model Calibration
### Aliases: hdnom.compare.calibrate

### ** Examples

# Load imputed SMART data
data(smart)
x = as.matrix(smart[, -c(1, 2)])
time = smart$TEVENT
event = smart$EVENT

# Compare lasso and adaptive lasso by 5-fold cross-validation
cmp.cal.cv = hdnom.compare.calibrate(
  x, time, event,
  model.type = c("lasso", "alasso"),
  method = "fitting",
  pred.at = 365 * 9, ngroup = 5, seed = 1001)

print(cmp.cal.cv)
summary(cmp.cal.cv)
plot(cmp.cal.cv)



