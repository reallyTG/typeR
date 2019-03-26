library(gensvm)


### Name: gensvm
### Title: Fit the GenSVM model
### Aliases: gensvm

### ** Examples

x <- iris[, -5]
y <- iris[, 5]

# fit using the default parameters and show progress
fit <- gensvm(x, y, verbose=TRUE)

# fit with some changed parameters
fit <- gensvm(x, y, lambda=1e-6)

# Early stopping defined through epsilon
fit <- gensvm(x, y, epsilon=1e-3)

# Early stopping defined through max.iter
fit <- gensvm(x, y, max.iter=1000)

# Nonlinear training
fit <- gensvm(x, y, kernel='rbf', max.iter=1000)
fit <- gensvm(x, y, kernel='poly', degree=2, gamma=1.0, max.iter=1000)

# Setting the random seed and comparing results
fit <- gensvm(x, y, random.seed=123, max.iter=1000)
fit2 <- gensvm(x, y, random.seed=123, max.iter=1000)
all.equal(coef(fit), coef(fit2))





