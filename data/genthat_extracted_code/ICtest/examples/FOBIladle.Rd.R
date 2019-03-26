library(ICtest)


### Name: FOBIladle
### Title: Ladle Estimate to Estimate the Number of Gaussian Components in
###   ICA or NGCA
### Aliases: FOBIladle
### Keywords: multivariate

### ** Examples

n <- 1000
X <- cbind(rexp(n), rt(n,5), rnorm(n), rnorm(n), rnorm(n), rnorm(n))

test <- FOBIladle(X)
test
summary(test)
plot(test)
ladleplot(test)



