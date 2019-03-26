library(SimDesign)


### Name: rmvnorm
### Title: Generate data with the multivariate normal (i.e., Gaussian)
###   distribution
### Aliases: rmvnorm

### ** Examples


# random normal values with mean [5, 10] and variances [3,6], and covariance 2
sigma <- matrix(c(3,2,2,6), 2, 2)
mu <- c(5,10)
x <- rmvnorm(1000, mean = mu, sigma = sigma)
head(x)
summary(x)
plot(x[,1], x[,2])





