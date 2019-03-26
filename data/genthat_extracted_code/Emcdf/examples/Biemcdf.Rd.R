library(Emcdf)


### Name: Biemcdf
### Title: Computes bivariate empirical joint distribution
### Aliases: Biemcdf

### ** Examples

n = 10^2
set.seed(123)
x = rnorm(n)
y = rnorm(n)
data = cbind(x, y)
Biemcdf(data)




