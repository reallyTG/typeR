library(kdist)


### Name: k
### Title: The K-distribution.
### Aliases: dk k pk qk rk

### ** Examples

#=====
r <- rk(10000, shape = 3, scale = 5, intensity = FALSE)
fn <- stats::ecdf(r)
x <- seq(0, 10, length = 100)
plot(x, fn(x))
lines(x, pk(x, shape = 3, scale = 5, intensity = FALSE))
#======
r <- rk(10000, shape = 3, scale = 5, intensity = FALSE)
d <- density(r)
x <- seq(0, 10, length = 100)
plot(d, xlim=c(0,10))
lines(x, dk(x, shape = 3, scale = 5, intensity = FALSE))



