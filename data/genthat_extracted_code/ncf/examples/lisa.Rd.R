library(ncf)


### Name: lisa
### Title: Local inidcator of spatial association
### Aliases: lisa
### Keywords: spatial

### ** Examples

# first generate some sample data
x <- expand.grid(1:20, 1:5)[, 1]
y <- expand.grid(1:20, 1:5)[, 2]

# z data from an exponential random field
z <- rmvn.spa(x = x, y = y, p = 2, method = "gaus")

# lisa analysis
fit1 <- lisa(x = x, y = y, z = z, neigh = 3, resamp = 500)
## Not run: plot(fit1, negh.mean=FALSE)



