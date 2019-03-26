library(FastSF)


### Name: ffused
### Title: Fast Fused Regression
### Aliases: ffused

### ** Examples


set.seed(111)
n <- 1000
sigma <- 0.5
y0 <- rep(0,n)
y0[100:150] <- 2.5
y0[400:600] <- -2.4
y0[800:810] <- 4
y <- y0 + sigma*rnorm(n)

re = ffused(y, s = 8, K.max = 5)





