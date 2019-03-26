library(attrCUSUM)


### Name: zipois
### Title: The Zero Inflated Poisson Distribution
### Aliases: dzipois pzipois qzipois rzipois zipois

### ** Examples

# Example 1: dzipois
dzipois(x = 0:10, rho = 0.1, lambda = 5)

# Example 2: pzipois
pzipois(q = 2, rho = 0.1, lambda = 5)

# Example 3: qzipois
qzipois(p = pzipois(2, 0.1, 5), rho = 0.1, lambda = 5)

# Example 4: rzipois
n <- 1e+5
rho <- 0.2
lambda <- 5
mean(rzipois(n, rho, lambda)) # Sample mean
lambda * (1 - rho) # Theoretical mean



