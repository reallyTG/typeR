library(coenocliner)


### Name: coenocline
### Title: Simulate species abundance (counts) or occurrence along one or
###   two gradients
### Aliases: coenocline
### Keywords: datagen

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

## Bernoulli distribution (occurrence)
## ===================================

h <- c(1,3,5,7,9) / 10
y <- coenocline(x, responseModel = "gaussian",
                params = cbind(opt = opt, tol = tol, h = h),
                countModel = "bernoulli")
head(y)
## probability of occurrence...
pi <- coenocline(x, responseModel = "gaussian",
                 params = cbind(opt = opt, tol = tol, h = h),
                 countModel = "bernoulli", expectation = TRUE)
## plot
plot(y, type = "p", pch = 1) # a random realisation
lines(pi, lty = "solid")     # probability of occurrence

## Correlated bivariate Gaussian response, two species
## ===================================================

## gradient locations
x <- seq(3.5, 7, length = 30)
y <- seq(1, 10, length = 30)
xy <- expand.grid(x = x, y = y)

## species parameters on gradients x and y
parx <- list(opt = c(5,6), tol = c(0.5,0.3), h = c(50, 75))
pary <- list(opt = c(5,7), tol = c(1.5, 1.5))

## evaluate response curves at gradient locations
sim <- coenocline(xy, params = list(px = parx, py = pary),
                  responseModel = "gaussian", expectation = TRUE,
                  extraParams = list(corr = 0.5))

## Perspective plots the bivariate responses of the two species
## 'sim' is a matrix 1 column per species with prod(length(x), length(y))
## rows. Need to reshape each species (column) vector into a matrix
## with as many rows as length(x) (number of gradient locations) and
## fill *column*-wise (the default)
persp(x, y, matrix(sim[,1], ncol = length(x)), # spp1
      theta = 45, phi = 30)
persp(x, y, matrix(sim[,2], ncol = length(x)), # spp2
      theta = 45, phi = 30)

## Poisson counts along two correlated gradients, Gaussian response
## ================================================================

set.seed(1)
N <-  100
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

head(y)
tail(y)

## Visualise one species' bivariate count data
persp(x1, x2, matrix(y[,3], ncol = length(x1)),
      ticktype = "detailed", zlab = "Abundance")

## Recreate beta responses in Fig. 2 of Minchin (1987)
## ===================================================

A0 <- c(5,4,7,5,9,8) * 10
m <- c(25,85,10,60,45,60)
r <- c(3,3,4,4,6,5) * 10
alpha <- c(0.1,1,2,4,1.5,1)
gamma <- c(0.1,1,2,4,0.5,4)
x <- 1:100
params <- list(m = m, A0 = A0, r = r, alpha = alpha, gamma = gamma)

## Expectations
set.seed(2)
y <- coenocline(x, responseModel = "beta",
                params = params,
                countModel = "poisson")
head(y)
plot(y, type = "l", lty = "solid")

y <- coenocline(x, responseModel = "beta",
                params = params,
                countModel = "poisson", expectation = TRUE)
plot(y, type = "l", lty = "solid")

## Zero-inflated Poisson, constant zero-inflation
## ==============================================

y <- coenocline(x, responseModel = "beta", params = params,
                countModel = "ZIP", countParams = list(zprobs = 0.2))
plot(y, type = "l", lty = "solid")

## Zero-inflated Negative binomial, constant zero-inflation
y <- coenocline(x, responseModel = "beta",
                params = params,
                countModel = "ZINB",
                countParams = list(alpha = 0.75, zprobs = 0.2))
plot(y, type = "l", lty = "solid")

## Binomial counts, constant size (m) of 100
## =========================================

## note: A0 must be in range, (0,1)
params[["A0"]] <- c(5,4,7,5,9,8) / 10
y <- coenocline(x, responseModel = "beta",
                params = params,
                countModel = "binomial",
                countParams = list(size = 100))
plot(y, type = "l", lty = "solid")

## Beta-Binomial counts, constant size (m) of 100
## ==============================================

## note: A0 must be in range, (0,1)
params[["A0"]] <- c(5,4,7,5,9,8) / 10
y <- coenocline(x, responseModel = "beta",
                params = params,
                countModel = "betabinomial",
                countParams = list(size = 100, theta = 0.1))
plot(y, type = "l", lty = "solid")



