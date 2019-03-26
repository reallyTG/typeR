library(hdnom)


### Name: print.hdcox.model
### Title: Print High-Dimensional Cox Model Objects
### Aliases: print.hdcox.model

### ** Examples

library("survival")

# Load imputed SMART data
data("smart")
x = as.matrix(smart[, -c(1, 2)])
time = smart$TEVENT
event = smart$EVENT
y = Surv(time, event)

fit = hdcox.lasso(x, y, nfolds = 5, rule = "lambda.1se", seed = 11)
print(fit)



