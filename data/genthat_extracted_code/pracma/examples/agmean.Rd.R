library(pracma)


### Name: agmean
### Title: Arithmetic-geometric Mean
### Aliases: agmean
### Keywords: arith

### ** Examples

##  Accuracy test: Gauss constant
1/agmean(1, sqrt(2))$agm - 0.834626841674073186  # 1.11e-16 < eps = 2.22e-16

## Gauss' AGM-based computation of \pi
a <- 1.0
b <- 1.0/sqrt(2)
s <- 0.5
d <- 1L
while (abs(a-b) > eps()) {
    t <- a
    a <- (a + b)*0.5
    b <- sqrt(t*b)
    c <- (a-t)*(a-t)
    d <- 2L * d
    s <- s - d*c
}
approx_pi <- (a+b)^2 / s / 2.0
abs(approx_pi - pi)             # 8.881784e-16 in 4 iterations

##  Example: Approximate elliptic integral
N <- 20
m <- seq(0, 1, len = N+1)[1:N]
E <- numeric(N)
for (i in 1:N) {
    f <- function(t) 1/sqrt(1 - m[i]^2 * sin(t)^2)
    E[i] <- quad(f, 0, pi/2)
}
A <- numeric(2*N-1)
a <- 1
b <- a * (1-m) / (m+1)

## Not run: 
##D plot(m, E, main = "Elliptic Integrals vs. arith.-geom. Mean")
##D lines(m, (a+b)*pi / 4 / agmean(a, b)$agm, col="blue")
##D grid()
## End(Not run)



