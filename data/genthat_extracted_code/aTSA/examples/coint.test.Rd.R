library(aTSA)


### Name: coint.test
### Title: Cointegration Test
### Aliases: coint.test

### ** Examples

X <- matrix(rnorm(200),100,2)
y <- 0.3*X[,1] + 1.2*X[,2] + rnorm(100)
# test for original y and X
coint.test(y,X)

# test for response = diff(y,differences = 1) and
# input = apply(X, diff, differences = 1)
coint.test(y,X,d = 1)



