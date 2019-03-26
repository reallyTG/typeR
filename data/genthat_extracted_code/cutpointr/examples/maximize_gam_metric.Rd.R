library(cutpointr)


### Name: maximize_gam_metric
### Title: Optimize a metric function in binary classification after
###   smoothing via generalized additive models
### Aliases: maximize_gam_metric minimize_gam_metric

### ** Examples

oc <- cutpointr(suicide, dsi, suicide, gender, method = maximize_gam_metric,
metric = accuracy)
plot_metric(oc)
oc <- cutpointr(suicide, dsi, suicide, gender, method = minimize_gam_metric,
metric = abs_d_sens_spec)
plot_metric(oc)



