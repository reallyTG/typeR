library(FastSF)


### Name: fsfused
### Title: Fast Sparse Fused Regression
### Aliases: fsfused

### ** Examples


n <- 1000
sigma <- 0.5
y0 <- rep(0,n)
y0[100:150] <- 2.5
y0[400:600] <- -2.4
y0[800:810] <- 4
y <- y0 + sigma*rnorm(n)

re = fsfused(y, s = 10, T = 300)




