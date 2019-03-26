library(relabeLoadings)


### Name: relabel
### Title: Relabel Factor Loadings from MCMC output
### Aliases: relabel relabel.matrix relabel.default
### Keywords: manip

### ** Examples


n <- 1000
p <- 8
set.seed(1)
mu <- as.numeric(t(cbind(
    matrix(rep(sample(c(-1, 1), size=n, replace=TRUE)*4, each=8), n, 8, byrow=TRUE),
    matrix(rep(sample(c(-1, 1), size=n, replace=TRUE)*4, each=8), n, 4, byrow=TRUE),
    matrix(rep(sample(c(-1, 1), size=n, replace=TRUE)*4, each=8), n, 4, byrow=TRUE))))
Lam <- matrix(rnorm(length(mu), mu, 1.0), n, 16, byrow=TRUE)
colnames(Lam) <- c(paste0("Lam[", 1:p, ",", 1, "]"),
                   paste0("Lam[", 1:4, ",", 2, "]"),
                   paste0("Lam[", 5:8, ",", 3, "]"))
## No test: 
par(mfrow=c(2, 8))
apply(Lam, 2, function(x) plot(density(x)))
## End(No test)
## Relabeling removes the bimodality
out <- relabel(Lam)
## No test: 
par(mfrow=c(2, 8))
apply(out$nuLam, 2, function(x) plot(density(x)))
## End(No test)




