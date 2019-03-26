library(ncf)


### Name: spatial.plot
### Title: Simple wrapper around symbols to visualize spatial data
### Aliases: spatial.plot
### Keywords: spatial

### ** Examples

# first generate some sample data
x <- expand.grid(1:20, 1:5)[, 1]
y <- expand.grid(1:20, 1:5)[, 2]

# z data from an exponential random field
z <- rmvn.spa(x = x, y = y, p = 2, method = "gaus")

# plot data
## Not run: spatial.plot(x = x, y = y, z = z, ctr = FALSE)



