library(pulsar)


### Name: pulsar-function
### Title: Graphical model functions for pulsar
### Aliases: pulsar-function

### ** Examples

## Generate a hub example
 dat <- huge::huge.generator(100, 40, 'hub', verbose=FALSE)

## Simple correlation thresholding
corrthresh <- function(data, lambda) {
  S <- cor(data)
  path <- lapply(lambda, function(lam) {
    tmp <- abs(S) > lam
    diag(tmp) <- FALSE
    as(tmp, 'lsCMatrix')
  })
  list(path=path)
}

## Inspect output
lam <- getLamPath(getMaxCov(dat$sigmahat), 1e-4, 10)
out.cor  <- pulsar(dat$data, corrthresh, fargs=list(lambda=lam))
out.cor

## Not run: 
##D ## Additional examples
##D ## quic
##D library(QUIC)
##D quicr <- function(data, lambda, ...) {
##D     S    <- cov(data)
##D     est  <- QUIC(S, rho=1, path=lambda, msg=0, tol=1e-2, ...)
##D     est$path <-  lapply(seq(length(lambda)), function(i) {
##D                    ## convert precision array to adj list
##D                    tmp <- est$X[,,i]; diag(tmp) <- 0
##D                  as(tmp!=0, "lgCMatrix")
##D     })
##D     est
##D }
##D ## clime
##D library(clime)
##D climer <- function(data, lambda, tol=1e-5, ...) {
##D      est <- clime(data, lambda, ...)
##D      est$path <- lapply(est$Omegalist, function(x) {
##D                      diag(x) <- 0
##D                      as(abs(x) > tol, "dsCMatrix")
##D                  })
##D      est
##D }
##D 
##D ## inverse cov shrinkage Schafer and Strimmer, 2005
##D library(corpcor)
##D icovshrink <- function(data, lambda, tol=1e-3, ...) {
##D      path <- lapply(lambda, function(lam) {
##D                      tmp <- invcov.shrink(data, lam, verbose=FALSE)
##D                      diag(tmp) <- 0
##D                      as(abs(tmp) > tol, "lsCMatrix")
##D                  })
##D      list(path=path)
##D }
##D 
##D ## Penalized linear model, only
##D library(glmnet)
##D lasso <- function(data, lambda, respind=1, family="gaussian", ...) {
##D          n <- length(lambda)
##D          tmp <- glmnet(data[,-respind], data[,respind],
##D                                    family=family, lambda=lambda, ...)
##D          path <-lapply(1:n, function(i) as(tmp$beta[,i,drop=FALSE], "lgCMatrix"))
##D          list(path=path)
##D }
##D 
##D ## alternative stability selection (DIFFERENT from hdi package)
##D out <- pulsar(dat$data, lasso, fargs=list(lambda=lam))
##D mergmat <- do.call('cbind', tmp$stars$merge)
##D image(mergmat)
## End(Not run)



