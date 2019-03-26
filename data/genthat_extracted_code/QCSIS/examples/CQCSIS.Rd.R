library(QCSIS)


### Name: CQCSIS
### Title: Compsote Quantile Correlation-Sure Independence Screening
###   (CQC-SIS)
### Aliases: CQCSIS CQCSIS

### ** Examples

n <- 20
p <- 200
x <- matrix(rnorm(n * p), n, p)
e <-  rnorm(n, 0, 1)
beta1 <- 3 - runif(1)
beta2 <- 3 - runif(1)
beta3 <- 3 - runif(1)
y <- beta1 * x[, 1] + beta2 * x[, 2] + beta3 * x[, 3] + e
d <- 19
fit.CQCSIS <- CQCSIS(x = x, y = y, d = d)
fit.CQCSIS$M





