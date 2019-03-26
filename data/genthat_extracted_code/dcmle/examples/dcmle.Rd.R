library(dcmle)


### Name: dcmle
### Title: Asymptotic maximum likelihood estimation with data cloning
### Aliases: dcmle
### Keywords: models htest

### ** Examples

## Data and model taken from Ponciano et al. 2009
## Ecology 90, 356-362.
paurelia <- c(17,29,39,63,185,258,267,392,510,
    570,650,560,575,650,550,480,520,500)
paramecium <- new("dcFit")
paramecium@data <- list(
    ncl=1, 
    n=length(paurelia), 
    Y=dcdim(data.matrix(paurelia)))
paramecium@model <- function() {
    for (k in 1:ncl) {
        for(i in 2:(n+1)){
            Y[(i-1), k] ~ dpois(exp(X[i, k])) # observations
            X[i, k] ~ dnorm(mu[i, k], 1 / sigma^2) # state
            mu[i, k] <- X[(i-1), k] + log(lambda) - log(1 + beta * exp(X[(i-1), k]))
        }
        X[1, k] ~ dnorm(mu0, 1 / sigma^2) # state at t0
    }
    beta ~ dlnorm(-1, 1) # Priors on model parameters
    sigma ~ dlnorm(0, 1)
    tmp ~ dlnorm(0, 1)
    lambda <- tmp + 1
    mu0 <- log(2)  + log(lambda) - log(1 + beta * 2)
}
paramecium@multiply <- "ncl"
paramecium@unchanged <- "n"
paramecium@params <- c("lambda","beta","sigma")
## Not run: 
##D (m1 <- dcmle(paramecium, n.clones=1, n.iter=1000))
##D (m2 <- dcmle(paramecium, n.clones=2, n.iter=1000))
##D (m3 <- dcmle(paramecium, n.clones=1:3, n.iter=1000))
##D cl <- makePSOCKcluster(3)
##D (m4 <- dcmle(paramecium, n.clones=2, n.iter=1000, cl=cl))
##D (m5 <- dcmle(paramecium, n.clones=1:3, n.iter=1000, cl=cl))
##D (m6 <- dcmle(paramecium, n.clones=1:3, n.iter=1000, cl=cl, 
##D     partype="parchains"))
##D (m7 <- dcmle(paramecium, n.clones=1:3, n.iter=1000, cl=cl, 
##D     partype="both"))
##D stopCluster(cl)
## End(Not run)



