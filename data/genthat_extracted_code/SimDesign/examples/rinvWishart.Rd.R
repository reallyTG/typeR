library(SimDesign)


### Name: rinvWishart
### Title: Generate data with the inverse Wishart distribution
### Aliases: rinvWishart

### ** Examples


# random inverse Wishart matrix given variances [3,6], covariance 2, and df=15
sigma <- matrix(c(3,2,2,6), 2, 2)
x <- rinvWishart(sigma = sigma, df = 15)
x

# list of matrices
x <- rinvWishart(20, sigma = sigma, df = 15)
x




