library(kappalab)


### Name: heuristic.ls.capa.ident
### Title: Heuristic least squares capacity identification
### Aliases: heuristic.ls.capa.ident
### Keywords: math

### ** Examples


## number of criteria
n <- 4

## the number of alternatives
n.a <- 1000

## a randomly generated 5-criteria matrix
C <- matrix(rnorm(n*n.a,10,2),n.a,n)

## the corresponding global scores
g <- numeric(n.a)

## generate a random capacity
x <- runif(2^n-1)
for (i in 2:(2^n-1))
    x[i] <- x[i] + x[i-1]
mu <- normalize(capacity(c(0,x)))
for (i in 1:n.a)
  g[i] <- Choquet.integral(mu,C[i,])

## the initial capacity
## here the uniform capacity
mu.in <- as.capacity(uniform.capacity(n))

## the solution 
hlsc <- heuristic.ls.capa.ident(n,mu.in,C,g)
mu.sol <- hlsc$solution

## the difference between mu and mu.sol
mu@data - mu.sol@data

hlsc



