library(DiscreteLaplace)


### Name: dlaplacelike2
### Title: Log-likelihood function for the ADSL distribution
### Aliases: dlaplacelike2
### Keywords: htest

### ** Examples

p <- 0.25
q <- 0.7
x <- rdlaplace2(n=100, p, q)
par <- estdlaplace2(x, "ML")
-dlaplacelike2(par, x) # greater than...
-dlaplacelike2(c(p, q), x)



