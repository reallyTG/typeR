library(sarima)


### Name: arma_Q0gnb
### Title: Compute the initial state covariance of ARMA model
### Aliases: arma_Q0gnb
### Keywords: arma arima

### ** Examples

Q0a <- arma_Q0gnb(c(0.2, 0.5), c(0.3)) 
Q0b <- makeARIMA(c(0.2, 0.5), c(0.3), Delta = numeric(0))$Pn
all.equal(Q0a, Q0b) ## TRUE

## see test/testthat/test-arma-q0.R for more;
## these functions cannot be defined in the package due to their use of
## \code{:::} on exported base R functions.
##
## "Gardner1980"
arma_Q0Gardner <- function(phi, theta, tol = .Machine$double.eps){
    ## tol is not used here
    .Call(stats:::C_getQ0, phi, theta)
}
## "Rossignol2011"
arma_Q0bis <- function(phi, theta, tol = .Machine$double.eps){
    .Call(stats:::C_getQ0bis, phi, theta, tol)
}

arma_Q0Gardner(c(0.2, 0.5), c(0.3))
arma_Q0bis(c(0.2, 0.5), c(0.3)) 
Q0a
Q0b



