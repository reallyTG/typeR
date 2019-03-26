library(hdnom)


### Name: hdnom.varinfo
### Title: Extract Information of Selected Variables from High-Dimensional
###   Cox Models
### Aliases: hdnom.varinfo

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
hdnom.varinfo(fit, x)



