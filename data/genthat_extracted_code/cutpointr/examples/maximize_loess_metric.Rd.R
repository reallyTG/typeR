library(cutpointr)


### Name: maximize_loess_metric
### Title: Optimize a metric function in binary classification after LOESS
###   smoothing
### Aliases: maximize_loess_metric minimize_loess_metric

### ** Examples

oc <- cutpointr(suicide, dsi, suicide, gender, method = maximize_loess_metric,
criterion = "aicc", family = "symmetric", degree = 2, user.span = 0.7,
metric = accuracy)
plot_metric(oc)
oc <- cutpointr(suicide, dsi, suicide, gender, method = minimize_loess_metric,
criterion = "aicc", family = "symmetric", degree = 2, user.span = 0.7,
metric = misclassification_cost, cost_fp = 1, cost_fn = 10)
plot_metric(oc)



