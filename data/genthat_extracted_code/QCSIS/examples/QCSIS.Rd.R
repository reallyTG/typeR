library(QCSIS)


### Name: QCSIS
### Title: Quantile Correlation-Sure Independence Screening (QC-SIS)
### Aliases: QCSIS QCSIS

### ** Examples

n <- 20
p <- 200
r <- 0.05
x <- matrix(rnorm(n * p), n, p)
e <- rnorm(n, 0, 1)
inde <- sample(n, r * n)
x[inde, 1] <- 2 * sqrt(rchisq(r * n, df = p))
y <- 5 * x[, 1] + 5 * x[, 2] + 5 * x[, 3] + e
d <- 19
fit.QCSIS <- QCSIS(x = x, y = y, d = d)
fit.QCSIS$M



