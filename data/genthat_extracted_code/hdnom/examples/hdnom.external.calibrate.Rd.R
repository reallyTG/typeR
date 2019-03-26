library(hdnom)


### Name: hdnom.external.calibrate
### Title: Externally Calibrate High-Dimensional Cox Models
### Aliases: hdnom.external.calibrate

### ** Examples

library("survival")

# Load imputed SMART data
data(smart)
# Use the first 1000 samples as training data
# (the data used for internal validation)
x = as.matrix(smart[, -c(1, 2)])[1:1000, ]
time = smart$TEVENT[1:1000]
event = smart$EVENT[1:1000]

# Take the next 1000 samples as external calibration data
# In practice, usually use data collected in other studies
x_new = as.matrix(smart[, -c(1, 2)])[1001:2000, ]
time_new = smart$TEVENT[1001:2000]
event_new = smart$EVENT[1001:2000]

# Fit Cox model with lasso penalty
fit = hdcox.lasso(
  x, Surv(time, event),
  nfolds = 5, rule = "lambda.1se", seed = 11)

# External calibration
cal.ext = hdnom.external.calibrate(
  fit, x, time, event,
  x_new, time_new, event_new,
  pred.at = 365 * 5, ngroup = 5)

print(cal.ext)
summary(cal.ext)
plot(cal.ext, xlim = c(0.6, 1), ylim = c(0.6, 1))



