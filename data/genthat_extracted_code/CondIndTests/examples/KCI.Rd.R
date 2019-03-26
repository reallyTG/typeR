library(CondIndTests)


### Name: KCI
### Title: Kernel conditional independence test.
### Aliases: KCI

### ** Examples

# Example 1
n <- 100
E <- rnorm(n)
X <- 4 + 2 * E + rnorm(n)
Y <- 3 * (X)^2 + rnorm(n)
KCI(Y, E, X)
KCI(Y, X, E)




