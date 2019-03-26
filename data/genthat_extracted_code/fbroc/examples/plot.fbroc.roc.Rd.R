library(fbroc)


### Name: plot.fbroc.roc
### Title: Plots a 'fbroc.roc' object
### Aliases: plot.fbroc.roc

### ** Examples

y <- rep(c(TRUE, FALSE), each = 100)
x <- rnorm(200) + y
result.boot <- boot.roc(x, y, n.boot = 100)
plot(result.boot)
plot(result.boot, show.metric = "auc")
plot(result.boot, show.metric = "auc", show.conf = FALSE) # show area instead
plot(result.boot, show.metric = "tpr", fpr = 0.2)
plot(result.boot, show.metric = "partial.auc", fpr = c(0, 0.5),
     show.partial.auc.warning = FALSE)
plot(result.boot, show.metric = "partial.auc", fpr = c(0, 0.5), show.conf = FALSE,
     show.partial.auc.warning = FALSE)  # show area instead



