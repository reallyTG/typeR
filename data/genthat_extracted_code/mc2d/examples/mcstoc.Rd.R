library(mc2d)


### Name: mcstoc
### Title: Creates Stochastic mcnode Objects
### Aliases: mcstoc
### Keywords: methods

### ** Examples

Oldnvar <- ndvar()
Oldnunc <- ndunc()
ndvar(5)
ndunc(4)

## compatibility with mcdata as arguments
x0 <- mcstoc(runif, type="0")
xV <- mcstoc(runif, type="V")
xU <- mcstoc(runif, type="U")
xVU <- mcstoc(runif, type="VU")

## "0" accepts mcdata "0"
mcstoc(runif, type="0", min=-10, max=x0)

## "V" accepts "0" mcdata and "V" mcdata
mcstoc(rnorm, type="V", mean=x0, sd=xV)

## "U" accepts "0" mcdata and "U" mcdata
mcstoc(rnorm, type="U", mean=x0, sd=xU)

## "VU" accepts "0" mcdata, "U" mcdata
## "V" mcdata and "U" mcdata with correct recycling
mcstoc(rnorm, type="VU", mean=x0, sd=xVU)
mcstoc(rnorm, type="VU", mean=xV, sd=xU)

## any function giving a set (vector/matrix) of value of length 'size' works
f <- function(popi) 1:popi
mcstoc(f, type="V", nsample="popi")

##Multivariates

ndvar(2)
ndunc(5)
##Build a multivariate node with univariate distribution
mcstoc(rnorm, "0", nvariates=3)
mcstoc(rnorm, "V", nvariates=3)
mcstoc(rnorm, "U", nvariates=3)
mcstoc(rnorm, "VU", nvariates=3)

##Build a multivariate node with multivariates distribution
alpha <- mcdata(c(1, 1000, 10, 100, 100, 10, 1000, 1), "V", nvariates=4)
(p <- mcstoc(rdirichlet, "V", alpha=alpha, nvariates=4))
mcstoc(rmultinomial, "VU", size=10, p, nvariates=4)

##Build a univariates node with "multivariates" distribution
size <- mcdata(c(1:5), "U")
mcstoc(rmultinomial, "VU", size, p, nvariates=1) #since a multinomial return one value

##Build a multivariates node with "multivariates" distribution
mcstoc(rmultinomial, "VU", size, p, nvariates=4) #sent 4 times to fill the array

##Use of rempiricalD with nodes
##A bootstrap
ndunc(5)
ndvar(5)
dataset <- c(1:9)
(b <- mcstoc(rempiricalD, "U", nvariates=9, values=dataset))
unclass(b)
##Then we build a VU node by sampling in each set of bootstrap
(node <- mcstoc(rempiricalD, "VU", values=b))
unclass(node)

## truncated
ndvar(2)
ndunc(5)
linf <- mcdata(-1:3, "U")
x <- mcstoc(rnorm, "VU", rtrunc=TRUE, linf=linf)
unclass(round(x))
linf <- mcdata(1:5, "U")
mcstoc(rnorm, "VU", nsv=100, rtrunc=TRUE, linf=linf, lhs=TRUE)

ndvar(Oldnvar)
ndunc(Oldnunc)



