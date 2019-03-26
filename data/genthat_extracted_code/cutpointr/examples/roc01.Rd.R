library(cutpointr)


### Name: roc01
### Title: Calculate the distance between points on the ROC curve and (0,1)
### Aliases: roc01

### ** Examples

roc01(10, 5, 20, 10)
roc01(c(10, 8), c(5, 7), c(20, 12), c(10, 18))
oc <- cutpointr(suicide, dsi, suicide,
  method = minimize_metric, metric = roc01)
plot_roc(oc)



