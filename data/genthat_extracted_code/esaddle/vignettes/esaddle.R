## ----setup, include=FALSE------------------------------------------------
library(knitr)
opts_chunk$set(out.extra='style="display:block; margin: auto"', fig.align="center", tidy=FALSE)

## ----gamma, message=F----------------------------------------------------
library(esaddle)
set.seed(4141)
x <- rgamma(1000, 2, 1)

# Fixing tuning parameter of EES
decay <-  0.05

# Evaluating EES at several point
xSeq <- seq(-2, 8, length.out = 200)
tmp <- dsaddle(y = xSeq, X = x, decay = decay, log = TRUE)  # Un-normalized EES
tmp2 <- dsaddle(y = xSeq, X = x, decay = decay,             # EES normalized by importance sampling
                normalize = TRUE, control = list("method" = "IS", nNorm = 500), log = TRUE)

# Plotting true density, EES and normal approximation
plot(xSeq, exp(tmp$llk), type = 'l', ylab = "Density", xlab = "x")
lines(xSeq, dgamma(xSeq, 2, 1), col = 3)
lines(xSeq, dnorm(xSeq, mean(x), sd(x)), col = 2)
lines(xSeq, exp(tmp2$llk), col = 4)
suppressWarnings( rug(x) )
legend("topright", c("EES un-norm", "EES normalized", "Truth", "Gaussian"), col = c(1, 4, 3, 2), lty = 1)
res <- findMode(x, init = mean(x), decay = decay)$mode
abline(v = res, lty = 2, lwd = 1.5)

## ----selGamma, message=F-------------------------------------------------
tmp <- selectDecay(decay = c(5e-4, 1e-3, 5e-3, 0.01, 0.1, 0.5, 5, Inf), # grid of decay values
                   K = 4,
                   simulator = function() x,
                   multicore = T,
                   ncores = 2)

## ----warp, message=F-----------------------------------------------------
dwarp <- function(x, alpha) {
  lik <- dnorm(x[ , 1], log = TRUE)
  tmp <- x[ , 1]^2
  lik <- lik + dnorm(x[ , 2] - alpha*tmp, log = TRUE)
  lik
}

rwarp <- function(n = 1, alpha) {
  z <- matrix(rnorm(n*2), n, 2)
  tmp <- z[ , 1]^2
  z[ , 2] <- z[ , 2] + alpha*tmp
  z
}

## ----warpGrid, message=F-------------------------------------------------
alpha <- 1
X <- rwarp(2000, alpha = alpha)

# Creating 2d grid
m <- 50
expansion <- 1
x1 <- seq(-2, 3, length=m)* expansion; 
x2 <- seq(-3, 3, length=m) * expansion
x <- expand.grid(x1, x2) 

# Evaluating true density on grid
alpha <- 1
dw <- exp( dwarp(x, alpha = alpha) )

# Evaluating EES density
dwa <- dsaddle(as.matrix(x), X, decay = 0.1, log = FALSE)$llk

## ----warpPlot, message=F-------------------------------------------------
# Plotting true density
par(mfrow = c(1, 2))
plot(X, pch=".", col=1, ylim = c(-2, 3), xlim = c(-2, 2),
     main = "True density", xlab = expression(X[1]), ylab = expression(X[2]))
contour(x1, x2, matrix(dw, m, m), levels = quantile(as.vector(dw), seq(0.8, 0.995, length.out = 10)), col=2, add=T)

# Plotting EES density
plot(X, pch=".",col=1, ylim = c(-2, 3), xlim = c(-2, 2),
     main = "EES density", xlab = expression(X[1]), ylab = expression(X[2]))
contour(x1, x2, matrix(dwa, m, m), levels = quantile(as.vector(dwa), seq(0.8, 0.995, length.out = 10)), col=2, add=T)

# Finding mode using EES 
init <- rnorm(2, 0, sd = c(1, 2)) # random initialization
res <- findMode(X = X, init = init, decay = decay)$mode
points(res[1], res[2], pch = 3, lwd = 2)

## ----warpSelect, message=F-----------------------------------------------
tmp <- selectDecay(decay = c(0.005, 0.01, 0.1, 0.25, 0.5, 1, 5, Inf), 
                   K = 4,
                   simulator = function() X,
                   multicore = T,
                   ncores = 2)

