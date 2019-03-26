library(clinfun)


### Name: ktau
### Title: Kendall's tau-b estimate
### Aliases: ktau
### Keywords: multivariate

### ** Examples

  set.seed(1234)
  x <- rnorm(10000); y <- x+rnorm(10000)
  cor(x, y, method="k")
  clinfun:::ktau(x,y)  



