library(hexbin)


### Name: hexbinplot
### Title: Trellis Hexbin Displays
### Aliases: hexbinplot hexbinplot.formula panel.hexbinplot
###   prepanel.hexbinplot hexlegendGrob
### Keywords: dplot

### ** Examples

mixdata <-
    data.frame(x = c(rnorm(5000),rnorm(5000,4,1.5)),
               y = c(rnorm(5000),rnorm(5000,2,3)),
               a = gl(2, 5000))
hexbinplot(y ~ x, mixdata, aspect = 1,
           trans = sqrt, inv = function(x) x^2)
hexbinplot(y ~ x | a, mixdata)
hexbinplot(y ~ x | a, mixdata, style = "lattice",
           xbnds = "data", ybnds = "data")
hexbinplot(y ~ x | a, mixdata, style = "nested.centroids")
hexbinplot(y ~ x | a, mixdata, style = "nested.centroids",
           border = FALSE, type = c("g", "smooth"))



