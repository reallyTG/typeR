## ---- dpi = 66-----------------------------------------------------------
set.seed(12345)
N <- 100
X <- data.frame(a=(1:N), b=(1:N) * rnorm(N, 10, 0.1),
                c=(N:1), d=(N:1) * rnorm(N, 10, 1.0))

## ---- dpi = 66, results = "hide", message = FALSE------------------------
library(propr)
phi <- propr(X, metric = "phi", symmetrize = TRUE)
rho <- propr(X, metric = "rho", ivar = 0)
phs <- propr(X, metric = "phs", ivar = 0)

## ------------------------------------------------------------------------
updateCutoffs(rho, cutoff =  seq(.05, .95, .3))

## ---- dpi = 66, message = FALSE------------------------------------------
rho99 <- rho[">", .95]
rho99@pairs

## ---- dpi = 66, message = FALSE------------------------------------------
rhoab <- subset(rho, select = c("a", "b"))
rhoab@matrix

## ---- dpi = 66, message = FALSE------------------------------------------
simplify(rho99)

## ---- dpi = 66, results = "hide", fig.show = "hold", fig.keep = "last"----
plot(rho99)

