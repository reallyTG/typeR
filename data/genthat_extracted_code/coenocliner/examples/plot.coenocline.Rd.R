library(coenocliner)


### Name: plot.coenocline
### Title: Plot species simulations along gradients
### Aliases: lines.coenocline plot.coenocline
### Keywords: hplot

### ** Examples

## Poisson counts along a single gradient, Gaussian response
## =========================================================

x <- seq(from = 4, to = 6, length = 100)
opt <- c(3.75, 4, 4.55, 5, 5.5) + 0.5
tol <- rep(0.25, 5)
h <- rep(20, 5)

## simulate
set.seed(1)
y <- coenocline(x, responseModel = "gaussian",
                params = cbind(opt = opt, tol = tol, h = h),
                countModel = "poisson")
head(y)

y <- coenocline(x, responseModel = "gaussian",
                params = cbind(opt = opt, tol = tol, h = h),
                countModel = "poisson",
                expectation = TRUE)
plot(y, type = "l", lty = "solid")



