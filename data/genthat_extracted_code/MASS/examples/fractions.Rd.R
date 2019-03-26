library(MASS)


### Name: fractions
### Title: Rational Approximation
### Aliases: fractions Math.fractions Ops.fractions Summary.fractions
###   [.fractions [<-.fractions as.character.fractions as.fractions
###   is.fractions print.fractions t.fractions
### Keywords: math

### ** Examples

X <- matrix(runif(25), 5, 5)
zapsmall(solve(X, X/5)) # print near-zeroes as zero
fractions(solve(X, X/5))
fractions(solve(X, X/5)) + 1



