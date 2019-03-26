library(hdnom)


### Name: hdnom.external.validate
### Title: Externally Validate High-Dimensional Cox Models with
###   Time-Dependent AUC
### Aliases: hdnom.external.validate

### ** Examples

library("survival")

# Load imputed SMART data
data(smart)
# Use the first 1000 samples as training data
# (the data used for internal validation)
x = as.matrix(smart[, -c(1, 2)])[1:1000, ]
time = smart$TEVENT[1:1000]
event = smart$EVENT[1:1000]

# Take the next 1000 samples as external validation data
# In practice, usually use data collected in other studies
x_new = as.matrix(smart[, -c(1, 2)])[1001:2000, ]
time_new = smart$TEVENT[1001:2000]
event_new = smart$EVENT[1001:2000]

# Fit Cox model with lasso penalty
fit = hdcox.lasso(
  x, Surv(time, event),
  nfolds = 5, rule = "lambda.1se", seed = 11)

# External validation with time-dependent AUC
val.ext = hdnom.external.validate(
  fit, x, time, event,
  x_new, time_new, event_new,
  tauc.type = "UNO",
  tauc.time = seq(0.25, 2, 0.25) * 365)

print(val.ext)
summary(val.ext)
plot(val.ext)




