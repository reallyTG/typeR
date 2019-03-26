library(rpql)


### Name: nb2
### Title: A negative binomial family
### Aliases: nb2

### ** Examples

## Not run: 
##D ## The function is currently defined as follows
##D nb2 <- function () {
##D     link <- "log"
##D     linkfun <- function(mu) log(mu)
##D     linkinv <- function(eta) pmax(exp(eta), .Machine$double.eps)
##D     mu.eta <- function(eta) pmax(exp(eta), .Machine$double.eps)
##D     variance <- function(mu, phi) mu + phi * mu^2
##D     valideta <- function(eta) TRUE
##D     validmu <- function(mu) all(mu > 0)
##D     structure(list(family = "negative.binomial", link = "log", 
##D         linkfun = linkfun, linkinv = linkinv, mu.eta = mu.eta, 
##D         variance = variance, valideta = valideta, validmu = validmu, 
##D         name = link), class = "family")
##D   }
## End(Not run)  



