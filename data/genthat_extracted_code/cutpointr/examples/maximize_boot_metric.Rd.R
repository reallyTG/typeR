library(cutpointr)


### Name: maximize_boot_metric
### Title: Optimize a metric function in binary classification after
###   bootstrapping
### Aliases: maximize_boot_metric minimize_boot_metric

### ** Examples

set.seed(100)
cutpointr(suicide, dsi, suicide, method = maximize_boot_metric,
          metric = accuracy, boot_cut = 30)
set.seed(100)
cutpointr(suicide, dsi, suicide, method = minimize_boot_metric,
          metric = abs_d_sens_spec, boot_cut = 30)



