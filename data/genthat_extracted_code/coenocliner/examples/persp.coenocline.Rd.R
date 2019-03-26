library(coenocliner)


### Name: persp.coenocline
### Title: Perspective Plot of Species Simulations Along Gradients
### Aliases: persp.coenocline
### Keywords: hplot

### ** Examples

## Poisson counts along two correlated gradients, Gaussian response
## ================================================================

set.seed(1)
N <-  40
x1 <- seq(from = 4, to = 6, length = N)
opt1 <- seq(4, 6, length = 5)
tol1 <- rep(0.25, 5)
x2 <- seq(from = 2, to = 20, length = N)
opt2 <- seq(2, 20, length = 5)
tol2 <- rep(1, 5)
h <- rep(30, 5)
xy <- expand.grid(x = x1, y = x2)

set.seed(1)
params <- list(px = list(opt = opt1, tol = tol1, h = h),
               py = list(opt = opt2, tol = tol2))
y <- coenocline(xy,
                responseModel = "gaussian",
                params = params,
                extraParams = list(corr = 0.5),
                countModel = "poisson")

## perspective plot(s) of simulated counts
layout(matrix(1:6, ncol = 3))
op <- par(mar = rep(1, 4))
persp(y)
par(op)
layout(1)

## as before but now just expectations
y <- coenocline(xy,
                responseModel = "gaussian",
                params = params,
                extraParams = list(corr = 0.5),
                countModel = "poisson",
                expectation = TRUE)

## perspective plots of response curves
layout(matrix(1:6, ncol = 3))
op <- par(mar = rep(1, 4))
persp(y)
par(op)
layout(1)

## Same plots generated using the `plot` method
layout(matrix(1:6, ncol = 3))
op <- par(mar = rep(1, 4))
persp(y)
par(op)
layout(1)



