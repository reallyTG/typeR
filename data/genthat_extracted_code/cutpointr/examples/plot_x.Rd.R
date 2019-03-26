library(cutpointr)


### Name: plot_x
### Title: Plot the distribution of the independent variable per class from
###   a cutpointr object
### Aliases: plot_x

### ** Examples

opt_cut <- cutpointr(suicide, dsi, suicide)
plot_x(opt_cut)

## With subgroup
opt_cut_2groups <- cutpointr(suicide, dsi, suicide, gender)
plot_x(opt_cut_2groups)



