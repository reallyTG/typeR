library(JWileymisc)


### Name: meanDecompose
### Title: Mean decomposition of a variable by group(s)
### Aliases: meanDecompose
### Keywords: multivariate

### ** Examples

meanDecompose(mpg ~ vs, data = mtcars)
meanDecompose(mpg ~ vs + cyl, data = mtcars)

## Example plotting the results
tmp <- meanDecompose(Sepal.Length ~ Species, data = iris)
do.call(plot_grid, c(lapply(names(tmp), function(x) {
  testdistr(tmp[[x]]$X, plot = FALSE, varlab = x)$Density
}), ncol = 1))

rm(tmp)



