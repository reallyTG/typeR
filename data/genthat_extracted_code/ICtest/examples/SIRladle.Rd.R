library(ICtest)


### Name: SIRladle
### Title: Ladle Estimate for SIR
### Aliases: SIRladle
### Keywords: multivariate

### ** Examples

n <- 1000
X <- cbind(rnorm(n), rnorm(n), rnorm(n), rnorm(n), rnorm(n))
eps <- rnorm(n, sd=0.02)
y <- 4*X[,1] + 2*X[,2] + eps


test <- SIRladle(X, y)
test
summary(test)
plot(test)
pairs(cbind(y, components(test)))
ladleplot(test)
ladleplot(test, crit = "fn")
ladleplot(test, crit = "lambda")
ladleplot(test, crit = "phin")



