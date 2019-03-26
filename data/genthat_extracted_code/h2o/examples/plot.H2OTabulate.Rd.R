library(h2o)


### Name: plot.H2OTabulate
### Title: Plot an H2O Tabulate Heatmap
### Aliases: plot.H2OTabulate

### ** Examples

## No test: 
library(h2o)
h2o.init()
df <- as.h2o(iris)
tab <- h2o.tabulate(data = df, x = "Sepal.Length", y = "Petal.Width",
             weights_column = NULL, nbins_x = 10, nbins_y = 10)
plot(tab)
## End(No test)



