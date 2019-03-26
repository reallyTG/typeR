library(sklarsomega)


### Name: baplot
### Title: Produce a Bland-Altman plot.
### Aliases: baplot

### ** Examples

# Reproduce the plot from Figure 4 of the package vignette.

data(cartilage)
baplot(cartilage$pre, cartilage$post, pch = 21, col = "navy", bg = "darkorange", lwd1 = 2,
       lwd2 = 2, lcol = "navy")



