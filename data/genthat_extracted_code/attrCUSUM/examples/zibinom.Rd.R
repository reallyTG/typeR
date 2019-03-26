library(attrCUSUM)


### Name: zibinom
### Title: The Zero Inflated Binomial Distribution
### Aliases: dzibinom pzibinom qzibinom rzibinom zibinom

### ** Examples

# Example 1: dzibinom
dzibinom(x = 0:10, rho = 0.1, size = 5, prob = 0.5)

# Example 2: pzibinom
pzibinom(q = 2, rho = 0.1, size = 5, prob = 0.5)

# Example 3: qzibinom
qzibinom(p = pzibinom(2, 0.1, 5, 0.5), rho = 0.1, size = 5, prob = 0.5)

# Example 4: rzibinom
n <- 1e+5
rho <- 0.2
size <- 5
prob <- 0.5
mean(rzibinom(n, rho, size, prob)) # Sample mean
(size * prob) * (1 - rho) # Theoretical mean



