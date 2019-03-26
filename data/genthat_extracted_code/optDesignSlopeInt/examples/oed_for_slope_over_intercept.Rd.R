library(optDesignSlopeInt)


### Name: oed_for_slope_over_intercept
### Title: Create an optimal design for measuring the slope divided by the
###   intercept
### Aliases: oed_for_slope_over_intercept

### ** Examples

xmin = 5 / 15
xmax = 19 / 1
n = 10
theta0 = 0.053
opt_homo_design = oed_for_slope_over_intercept(n, xmin, xmax, theta0)
table(opt_homo_design)



