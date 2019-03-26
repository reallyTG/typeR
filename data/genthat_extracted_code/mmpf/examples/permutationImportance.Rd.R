library(mmpf)


### Name: permutationImportance
### Title: computes permutation importance
### Aliases: permutationImportance

### ** Examples

X = replicate(3, rnorm(100))
y = X %*% runif(3)
data = data.frame(X, y)
fit = lm(y ~ -1 + X1 + X2 + X3, data)

permutationImportance(data, "X1", "y", fit)



