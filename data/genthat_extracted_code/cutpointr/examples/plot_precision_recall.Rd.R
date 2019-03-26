library(cutpointr)


### Name: plot_precision_recall
### Title: Precision recall plot from a cutpointr object
### Aliases: plot_precision_recall

### ** Examples

library(cutpointr)

## Optimal cutpoint for dsi
data(suicide)
opt_cut <- cutpointr(suicide, dsi, suicide)
plot_precision_recall(opt_cut)



