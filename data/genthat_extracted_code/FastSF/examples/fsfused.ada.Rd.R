library(FastSF)


### Name: fsfused.ada
### Title: Adaptive Fast Sparse Fused Regression
### Aliases: fsfused.ada

### ** Examples

n <- 1000
sigma <- 0.5
y0 <- rep(0,n)
y0[100:150] <- 2.5
y0[400:600] <- -2.4
y0[800:810] <- 4
y <- y0 + sigma*rnorm(n)

re = fsfused.ada(y, tau=1, s.max=10, T = 260, eps=1.2*sigma^2)





