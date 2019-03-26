library(cutpointr)


### Name: plot_cut_boot
### Title: Plot the bootstrapped distribution of optimal cutpoints from a
###   cutpointr object
### Aliases: plot_cut_boot

### ** Examples

set.seed(100)
opt_cut <- cutpointr(suicide, dsi, suicide, boot_runs = 10)
plot_cut_boot(opt_cut)



