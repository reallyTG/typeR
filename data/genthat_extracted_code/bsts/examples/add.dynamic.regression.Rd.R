library(bsts)


### Name: add.dynamic.regression
### Title: Dynamic Regression State Component
### Aliases: AddDynamicRegression DynamicRegressionOptions
###   DynamicRegressionArOptions DynamicRegressionRandomWalkOptions
### Keywords: models

### ** Examples

## Setting the seed to avoid small sample effects resulting from small
## number of iterations.
set.seed(8675309)
n <- 1000
x <- matrix(rnorm(n))

# beta follows a random walk with sd = .1 starting at -12.
beta <- cumsum(rnorm(n, 0, .1)) - 12

# level is a local level model with sd = 1 starting at 18.
level <- cumsum(rnorm(n)) + 18

# sigma.obs is .1
error <- rnorm(n, 0, .1)

y <- level + x * beta + error
par(mfrow = c(1, 3))
plot(y, main = "Raw Data")
plot(x, y - level, main = "True Regression Effect")
plot(y - x * beta, main = "Local Level Effect")

ss <- list()
ss <- AddLocalLevel(ss, y)
ss <- AddDynamicRegression(ss, y ~ x)
## In a real appliction you'd probably want more than 100
## iterations. See comment above about the random seed.
model <- bsts(y, state.specification = ss, niter = 100, seed = 8675309)
plot(model, "dynamic", burn = 10)



