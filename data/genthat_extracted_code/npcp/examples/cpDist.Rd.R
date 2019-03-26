library(npcp)


### Name: cpDist
### Title: Test for Change-Point Detection in Possibly Multivariate
###   Observations Sensitive to Changes in the Distribution Function
### Aliases: cpDist
### Keywords: htest multivariate nonparametric ts

### ** Examples

## A univariate example
n <- 100
k <- 50 ## the true change-point
y <- rnorm(k)
z <- rexp(n-k)
x <- matrix(c(y,z))
cp <- cpDist(x, b = 1)
cp

## All statistics
cp$all.statistics
## Corresponding p.values
cp$all.p.values

## Estimated change-point
which(cp$cvm == max(cp$cvm))
which(cp$ks == max(cp$ks))

## A very artificial trivariate example
## with a break in the first margin
n <- 100
k <- 50 ## the true change-point
y <- rnorm(k)
z <- rnorm(n-k, mean = 2)
x <- cbind(c(y,z),matrix(rnorm(2*n), n, 2))
cp <- cpDist(x, b = 1)
cp

## All statistics
cp$all.statistics
## Corresponding p.values
cp$all.p.values

## Estimated change-point
which(cp$cvm == max(cp$cvm))
which(cp$ks == max(cp$ks))



