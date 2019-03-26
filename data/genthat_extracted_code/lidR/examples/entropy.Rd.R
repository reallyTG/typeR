library(lidR)


### Name: entropy
### Title: Normalized Shannon diversity index
### Aliases: entropy

### ** Examples

z = runif(10000, 0, 10)

# expected to be close to 1. The highest diversity is given for a uniform distribution
entropy(z, by = 1)

 z = runif(10000, 9, 10)

# Must be 0. The lowest diversity is given for a unique possibility
entropy(z, by = 1)

z = abs(rnorm(10000, 10, 1))

# expected to be between 0 and 1.
entropy(z, by = 1)



