library(mixtools)


### Name: spEMsymloc
### Title: Semiparametric EM-like Algorithm for univariate symmetric
###   location mixture
### Aliases: spEMsymloc
### Keywords: file

### ** Examples

## Example from a normal location mixture
set.seed(100)
n <- 200
lambda <- c(1/3,2/3)
mu <- c(0, 4); sigma<-rep(1, 2)
x <- rnormmix(n, lambda, mu, sigma)
out.stoc <- spEMsymloc(x, mu0=c(-1, 2), stochastic=TRUE)
out.nonstoc <- spEMsymloc(x, mu0=c(-1, 2))



