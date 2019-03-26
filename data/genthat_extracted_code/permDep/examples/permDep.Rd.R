library(permDep)


### Name: permDep
### Title: Permutation test for general dependent truncation
### Aliases: permDep
### Keywords: permDep

### ** Examples

simDat <- function(n) {
  k <- s <- 1
  tt <- xx <- yy <- cc <- delta <- rep(-1, n)
  while(k <= n){
    tt[k] <- runif(1, 0, 3.5)
    xx[k] <- 1.95 + 0.65 * (tt[k] - 1.25)^2 + rnorm(1, sd = 0.1)
    cc[k] <- runif(1, 0, 10)
    delta[k] <- (xx[k] <= cc[k])
    yy[k] <- pmin(xx[k], cc[k])
    s <- s + 1
    if(tt[k] <= yy[k]) k = k+1
  }
 data.frame(list(trun = tt, obs = yy, delta = delta))
}

set.seed(123)
dat <- simDat(50)
B <- 20

## Perform conditional permutation with Kendall's tau, minp1 and minp2
set.seed(123)
system.time(fit <- with(dat, permDep(trun, obs, B, delta, nc = 1)))
fit



