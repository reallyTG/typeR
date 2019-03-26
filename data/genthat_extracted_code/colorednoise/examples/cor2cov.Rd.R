library(colorednoise)


### Name: cor2cov
### Title: Convert from Correlation Matrix to Covariance Matrix
### Aliases: cor2cov

### ** Examples

corr <- matrix(c(1, 0.53, 0.73, 0.53, 1, 0.44, 0.73, 0.44, 1), nrow = 3)
sigmas <- c(2, 0.3, 1.2)
covar <- cor2cov(sigmas, corr)
cov2cor(covar)



