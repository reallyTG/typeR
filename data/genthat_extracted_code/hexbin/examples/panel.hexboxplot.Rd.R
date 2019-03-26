library(hexbin)


### Name: panel.hexboxplot
### Title: Boxplot for hexbin lattice plot
### Aliases: panel.hexboxplot
### Keywords: hplot

### ** Examples

mixdata <-
    data.frame(x = c(rnorm(5000),rnorm(5000,4,1.5)),
               y = rep(1:2, 5000))
hexbinplot(y ~ x, mixdata, panel = panel.hexboxplot)



