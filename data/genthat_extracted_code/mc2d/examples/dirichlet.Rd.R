library(mc2d)


### Name: dirichlet
### Title: The Dirichlet Distribution
### Aliases: dirichlet ddirichlet rdirichlet
### Keywords: distribution

### ** Examples

dat <- c(1, 10, 100, 1000, 1000, 100, 10, 1)
(alpha <- matrix(dat, nrow=4, byrow=TRUE))
round(x <- rdirichlet(4, alpha), 2)
ddirichlet(x, alpha)

## rdirichlet used with mcstoc
mcalpha <- mcdata(dat, type="V", nsv=4, nvariates=2)
(x <- mcstoc(rdirichlet, type="V", alpha=mcalpha, nsv=4, nvariates=2))
unclass(x)
x <- mcstoc(rdirichlet, type="VU", alpha=mcalpha, nsv=4, nsu=10, nvariates=2)
unclass(x)




