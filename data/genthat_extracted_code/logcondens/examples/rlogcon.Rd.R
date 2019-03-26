library(logcondens)


### Name: rlogcon
### Title: Generate random sample from the log-concave and the smoothed
###   log-concave density estimator
### Aliases: rlogcon
### Keywords: htest nonparametric

### ** Examples


## ===================================================
## Generate random samples as described in Section 3 of
## Duembgen and Rufibach (2009)
## ===================================================
x0 <- rnorm(111)
n <- 22
random <- rlogcon(n, x0)

## sample of size n from the log-concave density estimator
random$X

## sample of size n from the smoothed log-concave density estimator
random$X_star



