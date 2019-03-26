library(leiv)


### Name: leiv
### Title: Bivariate Linear Errors-In-Variables Estimation
### Aliases: leiv leiv-class leiv-package print-methods print,ANY-method
###   print,leiv-method plot-methods plot,ANY,ANY-method
###   plot,leiv,missing-method
### Keywords: models regression

### ** Examples

## generate artificial data 
set.seed(1123)
n <- 20
X <- rnorm(n, mean=5, sd=4) # true x
x <- X + rnorm(n, mean=0, sd=5) # observed x
Y <- 2 + X # true y
y <- Y + rnorm(n, mean=0, sd=3) # observed y

## fit with default options
fit <- leiv(y ~ x)
print(fit)
plot(fit) # density plot
dev.new()
plot(fit,plotType="scatter")

## calculate a density to use as an informative prior density of
## the scale invariant slope in a subsequent fit
fit0 <- leiv(n=10, cor=0.5, sdRatio=1.0)
print(fit0)

## refit the data using the informative prior density
fit1 <- leiv(y ~ x, prior=fit0, abs.tol=1e-6)
print(fit1)



