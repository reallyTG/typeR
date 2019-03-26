library(copula)


### Name: pobs
### Title: Pseudo-Observations
### Aliases: pobs

### ** Examples

## Simple definition of the function:
pobs
## Draw from a multivariate normal distribution
d <- 10
set.seed(1)
P <- Matrix::nearPD(matrix(pmin(pmax(runif(d*d), 0.3), 0.99), ncol=d))$mat
diag(P) <- rep(1, d)
n <- 500
x <- MASS::mvrnorm(n, mu = rep(0, d), Sigma = P)

## Compute pseudo-observations (should roughly follow a Gauss
## copula with correlation matrix P)
u <- pobs(x)
plot(u[,5],u[,10], xlab=quote(italic(U)[1]), ylab=quote(italic(U)[2]))
## Don't show: 
if(requireNamespace("zoo")) {
 z <- zoo::zoo(x)
 uz <- pobs(z)
 stopifnot( uz == u, identical(dim(uz), dim(u)), inherits(uz, "zoo"))
}
## End(Don't show)
## All components: pairwise plot
pairs(u, gap=0, pch=".", labels =
      as.expression( lapply(1:d, function(j) bquote(italic(U[.(j)]))) ))



