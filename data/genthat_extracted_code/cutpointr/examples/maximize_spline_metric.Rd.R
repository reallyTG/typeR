library(cutpointr)


### Name: maximize_spline_metric
### Title: Optimize a metric function in binary classification after spline
###   smoothing
### Aliases: maximize_spline_metric minimize_spline_metric

### ** Examples

oc <- cutpointr(suicide, dsi, suicide, gender, method = maximize_spline_metric,
df = 5, metric = accuracy)
plot_metric(oc)



