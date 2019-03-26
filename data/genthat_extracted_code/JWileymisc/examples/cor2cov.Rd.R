library(JWileymisc)


### Name: cor2cov
### Title: Convert a correlation matrix and standard deviations to a
###   covariance matrix
### Aliases: cor2cov

### ** Examples

# using a built in dataset
cor2cov(cor(longley), sapply(longley, sd))

# should match the above covariance matarix
cov(longley)
all.equal(cov(longley), cor2cov(cor(longley), sapply(longley, sd)))



