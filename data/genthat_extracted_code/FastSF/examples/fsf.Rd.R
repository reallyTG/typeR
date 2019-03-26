library(FastSF)


### Name: fsf
### Title: Fast Structural Filtering
### Aliases: fsf

### ** Examples

require(limSolve)
n <- 1000
sigma <- 0.5
y0 <- rep(0,n)
y0[100:150] <- 2
y0[400:600] <- -1
y0[800:810] <- 4
y <- y0 + sigma*rnorm(n)
y[800:810] <- y0[800:810] + sigma*rnorm(11)
D0 <- matrix(0, n-1,n)
diag(D0) <- -1
for(i in 1:(n-1)) D0[i,i+1] <- 1
m <- dim(D0)[1]

re = fsf(y, D0)




