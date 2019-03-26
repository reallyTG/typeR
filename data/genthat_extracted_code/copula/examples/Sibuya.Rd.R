library(copula)


### Name: Sibuya
### Title: Sibuya Distribution - Sampling and Probabilities
### Aliases: Sibuya rSibuya pSibuya dSibuya rSibuyaR dsumSibuya
### Keywords: distribution

### ** Examples

## Sample n random variates from a Sibuya(alpha) distribution and plot a
## histogram
n <- 1000
alpha <- .4
X <- rSibuya(n, alpha)
hist(log(X), prob=TRUE); lines(density(log(X)), col=2, lwd=2)



