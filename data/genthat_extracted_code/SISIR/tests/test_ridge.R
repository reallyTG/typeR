library(SISIR)

set.seed(1140)

tsteps <- seq(0, 1, length = 200)
nsim <- 100
simulate_bm <- function() return(c(0, cumsum(rnorm(length(tsteps)-1, sd=1))))
x <- t(replicate(nsim, simulate_bm()))
beta <- cbind(sin(tsteps*3*pi/2), sin(tsteps*5*pi/2))
y <- log(abs(x %*% beta[ ,1])) + sqrt(abs(x %*% beta[ ,2])) + 
  rnorm(nsim, sd = 0.1)

# perform ridge regression
res_ridge <- ridgeSIR(x, y, H = 10, d = 5, mu2 = 10^8)

# test if normalization is OK
norm_EDR <- res_ridge$utils$norm_EDR
stopifnot(max(abs(
  diag(res_ridge$parameters$d) - 
    crossprod(res_ridge$EDR, norm_EDR) %*% res_ridge$EDR
  )) < 10^(-10))
