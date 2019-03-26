library(SimDesign)


### Name: rmvt
### Title: Generate data with the multivariate t distribution
### Aliases: rmvt

### ** Examples


# random t values given variances [3,6], covariance 2, and df = 15
sigma <- matrix(c(3,2,2,6), 2, 2)
x <- rmvt(1000, sigma = sigma, df = 15)
head(x)
summary(x)
plot(x[,1], x[,2])





