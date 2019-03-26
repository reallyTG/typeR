library(ICtest)


### Name: PCAladle
### Title: Ladle Estimate for PCA
### Aliases: PCAladle
### Keywords: multivariate

### ** Examples

n <- 1000
Y <- cbind(rnorm(n, sd=2), rnorm(n,sd=2), rnorm(n), rnorm(n), rnorm(n), rnorm(n))

testPCA <- PCAladle(Y)
testPCA
summary(testPCA)
plot(testPCA)
ladleplot(testPCA)
ladleplot(testPCA, crit = "fn")
ladleplot(testPCA, crit = "lambda")
ladleplot(testPCA, crit = "phin")



