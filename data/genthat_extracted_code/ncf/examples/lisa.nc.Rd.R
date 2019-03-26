library(ncf)


### Name: lisa.nc
### Title: Non-centered inidcators of spatial association
### Aliases: lisa.nc
### Keywords: spatial

### ** Examples

# first generate some sample data
x <- expand.grid(1:20, 1:5)[, 1]
y <- expand.grid(1:20, 1:5)[,2]

# z data from an exponential random field
z <- cbind(
  rmvn.spa(x = x, y = y, p = 2, method = "exp"), 
  rmvn.spa(x = x, y = y, p = 2, method = "exp")
  )

# lisa.nc analysis
fit1 <- lisa.nc(x = x, y = y, z = z, neigh = 3)
## Not run: plot(fit1)



