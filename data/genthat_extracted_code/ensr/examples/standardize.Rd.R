library(ensr)


### Name: standardize
### Title: Standardize
### Aliases: standardize

### ** Examples

x <- 1:100
standardize(x)
standardize(x, stats = list(center = "median", scale = "IQR"))

xmat <- matrix(1:50, nrow = 10)
standardize(xmat, margin = 0)
standardize(xmat, margin = 1)
standardize(xmat, margin = 2)

xarray <- array(1:60, dim = c(5, 2, 6))
standardize(xarray, margin = 0)
standardize(xarray, margin = 1:2)

# Standardize a data.frame
standardize(mtcars)

# a generic list object
alist <- list(x = rep(1:10, 2), y = rnorm(100), z = matrix(1:10, nrow = 2))
standardize(alist, margin = 0)
standardize(alist, margin = 1)



