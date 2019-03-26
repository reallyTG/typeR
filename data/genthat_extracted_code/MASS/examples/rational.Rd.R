library(MASS)


### Name: rational
### Title: Rational Approximation
### Aliases: rational .rat
### Keywords: math

### ** Examples

X <- matrix(runif(25), 5, 5)
zapsmall(solve(X, X/5)) # print near-zeroes as zero
rational(solve(X, X/5))



