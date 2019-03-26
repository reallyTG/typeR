library(cardidates)


### Name: fitweibull
### Title: Fit Four or Six Parametric Weibull Functions
### Aliases: fitweibull fitweibull6 fitweibull4
### Keywords: nonlinear optimize

### ** Examples

## create some test data
set.seed(123)
x <- seq(0, 360, length = 20)
y <- abs(rnorm(20, mean = 1, sd = 0.1))
y[5:10] <- c(2, 4, 7, 3, 4, 2)

## fit Weibull function with 6 free parameters
res <- fitweibull6(x, y)

## show some properties
res$r2
p <- res$p
o <- res$fit
f <- res$ymax

## fit 6 parameter Weibull with user-provided start parameters

x <- seq(0, 150)
y <- fweibull6(x, c(0.8, 40, 5, 0.2, 80, 5)) + rnorm(x, sd = 0.1)
plot(x, y)
res <- fitweibull6(x, y, p0 = c(0, 40, 1, 1, 60, 0))
plot(res)



