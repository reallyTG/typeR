library(BAMBI)


### Name: rvmmix
### Title: The univariate von Mises mixtures
### Aliases: rvmmix dvmmix

### ** Examples

kappa <- 1:3
mu <- 0:2
pmix <- c(0.3, 0.3, 0.4)
x <- 1:10
n <- 10

# mixture densities calculated at each point in x
dvmmix(x, kappa, mu, pmix)

# number of observations generated from the mixture distribution is n
rvmmix(n, kappa, mu, pmix)




