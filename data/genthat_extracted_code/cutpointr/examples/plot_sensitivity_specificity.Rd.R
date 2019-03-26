library(cutpointr)


### Name: plot_sensitivity_specificity
### Title: Sensitivity and specificity plot from a cutpointr object
### Aliases: plot_sensitivity_specificity

### ** Examples

library(cutpointr)

## Optimal cutpoint for dsi
data(suicide)
opt_cut <- cutpointr(suicide, dsi, suicide)
plot_sensitivity_specificity(opt_cut)



