library(cmna)


### Name: summation
### Title: Two summing algorithms
### Aliases: summation naivesum kahansum pwisesum

### ** Examples

k <- 1:10^6
n <- sample(k, 1)
bound <- sample(k, 2)
bound.upper <- max(bound) - 10^6 / 2
bound.lower <- min(bound) - 10^6 / 2
x <- runif(n, bound.lower, bound.upper)
naivesum(x)
kahansum(x)
pwisesum(x)



