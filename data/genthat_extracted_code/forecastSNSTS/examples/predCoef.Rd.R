library(forecastSNSTS)


### Name: predCoef
### Title: h-step Prediction coefficients
### Aliases: predCoef

### ** Examples

T <- 100
X <- rnorm(T)

P <- 5
H <- 1
m <- 20

Nmin <- 25
pcoef <- predCoef(X, P, H, (T - m - H + 1):T, c(0, seq(Nmin, T - m - H, 1)))

## Access the prediction vector for p = 2, h = 1, t = 95, N = 25
p <- 2
h <- 1
t <- 95
N <- 35
res <- pcoef$coef[p, 1:p, h, pcoef$t == t, pcoef$N == N]



