## ---- dpi = 66-----------------------------------------------------------
library(propr)
N <- 100
a <- seq(from = 5, to = 15, length.out = N)
b <- a * rnorm(N, mean = 1, sd = 0.1)
c <- rnorm(N, mean = 10)
d <- rnorm(N, mean = 10)
e <- rep(10, N)
X <- data.frame(a, b, c, d, e)

## ---- dpi = 66-----------------------------------------------------------
Y <- X / rowSums(X) * abs(rnorm(N))

## ---- dpi = 66-----------------------------------------------------------
all(round(X[, 2] / X[, 1] - Y[, 2] / Y[, 1], 5) == 0)

## ---- dpi = 66, fig.show = "hold"----------------------------------------
pairs(X) # absolute data

## ---- dpi = 66, fig.show = "hold"----------------------------------------
pairs(Y) # relative data

## ---- dpi = 66, warning = FALSE------------------------------------------
suppressWarnings(cor(X)) # absolute correlation
cor(Y) # relative correlation

## ---- dpi = 66-----------------------------------------------------------
propr:::proprVLR(Y[, 1:4]) # relative VLR
propr:::proprVLR(X) # absolute VLR

## ---- dpi = 66, fig.show = "hold"----------------------------------------
pairs(propr:::proprCLR(Y[, 1:4])) # relative clr-transformation

## ---- dpi = 66, fig.show = "hold"----------------------------------------
pairs(propr:::proprCLR(X)) # absolute clr-transformation

## ---- dpi = 66, fig.show = "hold", message = FALSE-----------------------
propr(Y[, 1:4])@matrix # relative proportionality with clr

## ---- dpi = 66, fig.show = "hold", message = FALSE-----------------------
propr(X)@matrix # absolute proportionality with clr

## ---- dpi = 66, fig.show = "hold"----------------------------------------
pairs(propr:::proprALR(Y, ivar = 5)) # relative alr

## ---- dpi = 66, fig.show = "hold"----------------------------------------
pairs(X[, 1:4]) # absolute data

## ---- dpi = 66, message = FALSE------------------------------------------
propr(Y, ivar = 5)@matrix # relative proportionality with alr

## ---- dpi = 66-----------------------------------------------------------
pairs(propr:::proprALR(X, ivar = 1)) # new relative alr

## ---- dpi = 66, message = FALSE------------------------------------------
propr(X, ivar = 1)@matrix # new relative proportionality with alr

## ------------------------------------------------------------------------
citation("propr")

