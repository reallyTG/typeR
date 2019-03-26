library(Emcdf)


### Name: plotcdf
### Title: Plots multivariate empirical joint distribution of bivariate
###   data
### Aliases: plotcdf

### ** Examples


n = 10
set.seed(123)
x = rnorm(n)
y = x^2 + 0.1*rnorm(n)
data = cbind(x, y)
plotcdf(data, type = "multiple_wireframe")




