library(QCSIS)


### Name: qc
### Title: Quantile Correlation
### Aliases: qc qc

### ** Examples

n   <- 1000
x   <- rnorm(n)
y   <- 2 * x + rt(n,df = 1)
tau <- 1:9 / 10
qc(x = x, y = y, tau = tau)



