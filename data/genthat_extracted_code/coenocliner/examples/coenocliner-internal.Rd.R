library(coenocliner)


### Name: prettyHead
### Title: Pretty Display of a Matrix or Data Frame
### Aliases: prettyHead
### Keywords: internal

### ** Examples


x <- seq(from = 4, to = 6, length = 30)
opt <- seq(4, 7, length = 100)
tol <- rep(0.25, 100)
h <- rep(20, 100)

## simulate
set.seed(1)
y <- coenocline(x, responseModel = "gaussian",
                params = cbind(opt = opt, tol = tol, h = h),
                countModel = "poisson")

prettyHead(y)




