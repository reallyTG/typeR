library(hdnom)


### Name: predict.hdcox.model
### Title: Make Predictions from High-Dimensional Cox Models
### Aliases: predict.hdcox.model

### ** Examples

library("survival")

# Load imputed SMART data
data("smart")
x = as.matrix(smart[, -c(1, 2)])
time = smart$TEVENT
event = smart$EVENT
y = Surv(time, event)

fit = hdcox.lasso(x, y, nfolds = 5, rule = "lambda.1se", seed = 11)
predict(fit, x, y, newx = x[101:105, ], pred.at = 1:10 * 365)



