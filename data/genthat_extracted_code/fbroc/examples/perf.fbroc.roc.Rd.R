library(fbroc)


### Name: perf.fbroc.roc
### Title: Calculate performance for bootstrapped ROC curve
### Aliases: perf.fbroc.roc

### ** Examples

y <- rep(c(TRUE, FALSE), each = 100)
x <- rnorm(200) + y
result.boot <- boot.roc(x, y, n.boot = 100)
perf(result.boot, "auc")
perf(result.boot, "auc", conf.level = 0.99)
perf(result.boot, "partial.auc", fpr = c(0, 0.25), show.partial.auc.warning = FALSE)



