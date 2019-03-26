library(logcondiscr)


### Name: Triangular
### Title: Functions to compute a and simulate from a triangular
###   probability mass function
### Aliases: dTriangular rTriangular
### Keywords: distribtion htest nonparametric

### ** Examples


## -------------------------------------------------------------
## compute values of triangular density and simulate from it
## -------------------------------------------------------------
a <- 1
b <- 7
c <- 8
d <- 11
e <- 2
n <- 10 ^ 2

## support
x <- seq(a, d, by = 1)

## true density
dens <- dTriangular(a, b, c, d, e)
logdens <- log(dens)
rand <- rTriangular(n, a, b, c, d, e)$rand

## does the same as rTriangular()
rand2 <- sample(x = a:d, size = n, prob = dens, replace = TRUE)



