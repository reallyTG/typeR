library(Hmisc)


### Name: GiniMd
### Title: Gini's Mean Difference
### Aliases: GiniMd
### Keywords: robust univar

### ** Examples

set.seed(1)
x <- rnorm(40)
# Test GiniMd against a brute-force solution
gmd <- function(x) {
  n <- length(x)
  sum(outer(x, x, function(a, b) abs(a - b))) / n / (n - 1)
  }
GiniMd(x)
gmd(x)

z <- c(rep(0,17), rep(1,6))
n <- length(z)
GiniMd(z)
2*mean(z)*(1-mean(z))*n/(n-1)

a <- 12; b <- 13; c <- 7; n <- a + b + c
A <- -.123; B <- -.707; C <- 0.523
xx <- c(rep(A, a), rep(B, b), rep(C, c))
GiniMd(xx)
2*(a*b*abs(A-B) + a*c*abs(A-C) + b*c*abs(B-C))/n/(n-1)



