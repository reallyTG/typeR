library(h2o)


### Name: h2o.tabulate
### Title: Tabulation between Two Columns of an H2OFrame
### Aliases: h2o.tabulate

### ** Examples

## No test: 
library(h2o)
h2o.init()
df <- as.h2o(iris)
tab <- h2o.tabulate(data = df, x = "Sepal.Length", y = "Petal.Width",
             weights_column = NULL, nbins_x = 10, nbins_y = 10)
plot(tab)
## End(No test)



