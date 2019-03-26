library(PolynomF)


### Name: PolynomF-package
### Title: Polynomials in R
### Aliases: PolynomF-package PolynomF
### Keywords: package symbolmath

### ** Examples

x <- polynom()
p <- (x-1)^2 + 1
p
plot(p)

pv <- p(-3:4); pv

p1 <- p(p-1); p1;
plot(polylist(p, p1))

## Hermite polynomials to degree 10
H <- polylist(1, x)
for(n in 2:10)
    H[[n+1]] <- x*H[[n]] - (n-1)*H[[n-1]]
H
### normalisation to unit length
for(n in 1:11)
    H[[n]] <- H[[n]]*exp(-lgamma(n)/2)

plot(H, xlim = c(-3,3))

## orthogonality relationship check:
f <- function(i,j) stats::integrate(function(z)
      dnorm(z)*H[[i+1]](z)*H[[j+1]](z), -Inf, Inf)

f(2,3)
f(4,4)


