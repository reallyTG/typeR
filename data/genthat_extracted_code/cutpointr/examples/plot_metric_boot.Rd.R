library(cutpointr)


### Name: plot_metric_boot
### Title: Plot the bootstrapped metric distribution from a cutpointr
###   object
### Aliases: plot_metric_boot

### ** Examples

set.seed(300)
opt_cut <- cutpointr(suicide, dsi, suicide, boot_runs = 10)
plot_metric_boot(opt_cut)



