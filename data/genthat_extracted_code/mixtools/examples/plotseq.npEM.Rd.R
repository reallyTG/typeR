library(mixtools)


### Name: plotseq.npEM
### Title: Plotting sequences of estimates from non- or semiparametric
###   EM-like Algorithm
### Aliases: plotseq.npEM
### Keywords: file

### ** Examples

## Example from a normal location mixture
n <- 200
set.seed(100)
lambda <- c(1/3,2/3)
mu <- c(0, 4); sigma<-rep(1, 2)
x <- rnormmix(n, lambda, mu, sigma)
b <- spEMsymloc(x, mu0=c(-1, 2), stochastic=FALSE)
plotseq(b)
bst <- spEMsymloc(x, mu0=c(-1, 2), stochastic=TRUE)
plotseq(bst)



