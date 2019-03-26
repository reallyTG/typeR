library(NMOF)


### Name: xwGauss
### Title: Integration of Gauss-type
### Aliases: xwGauss changeInterval

### ** Examples

## examples from Gilli/Maringer/Schumann (2011), ch. 15

## a test function
f1 <- function(x) exp(-x)
m <- 5; a <- 0; b <- 5
h <- (b - a)/m

## rectangular rule -- left
w <- h; k <- 0:(m-1); x <- a + k * h
sum(w * f1(x))

## rectangular rule -- right
w <- h; k <- 1:m ; x <- a + k * h
sum(w * f1(x))

## midpoint rule
w <- h; k <- 0:(m-1); x <- a + (k + 0.5)*h
sum(w * f1(x))

## trapezoidal rule
w <- h
k <- 1:(m-1)
x <- c(a, a + k*h, b)
aux <- w * f1(x)
sum(aux) - (aux[1] + aux[length(aux)])/2

## R's integrate (from package stats)
integrate(f1, lower = a,upper = b)

## Gauss--Legendre
temp <- xwGauss(m)
temp <- changeInterval(temp$nodes, temp$weights,
                       oldmin = -1, oldmax = 1, newmin =  a, newmax = b)
x <- temp$nodes; w <- temp$weights
sum(w * f1(x))



