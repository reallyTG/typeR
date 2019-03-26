library(Renvlp)


### Name: pred.stenv
### Title: Estimation or prediction for stenv
### Aliases: pred.stenv

### ** Examples

data(fiberpaper)
X <- fiberpaper[ , 5:7]
Y <- fiberpaper[ , 1:4]

m <- stenv(X, Y, 2, 3)
m

pred.res <- pred.stenv(m, X[1, ])
pred.res




