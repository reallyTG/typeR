library(FastSF)


### Name: fsf.ada
### Title: Adaptive Fast Structural Filtering
### Aliases: fsf.ada

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
ddt <- D0%*%t(D0)
ddinv<- Solve.banded(ddt, 1,1, B = diag(1,dim(D0)[1]))

re <- fsf.ada(y, D0, tau = 1, s.max = 10, eps = 0.1, ddinv = ddinv)




