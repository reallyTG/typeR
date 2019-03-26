library(SCPME)


### Name: shrink
### Title: Shrinking characteristics of precision matrix estimators
### Aliases: shrink

### ** Examples

# generate some data
data = data_gen(n = 100, p = 5, r = 1)

# lasso penalized omega (glasso)
shrink(X = data$X, Y = data$Y)

# lasso penalized beta (print estimated omega)
lam.max = max(abs(t(data$X) %*% data$Y))
(shrink = shrink(X = data$X, Y = data$Y, B = cov(data$X, data$Y), lam.max = lam.max))

# print estimated beta
shrink$Z



