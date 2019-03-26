## rm(list=ls())
## library("testthat")
## library("optimParallel", lib.loc = "../../../lib/")
source("testsetup.R")
context("test-spam")

control <- structure(list(maxit = 10,
                          factr = 2.22044604925031e-16),
                     .Names = c("maxit","factr"))


test_that("optimParallel - mle.spam",{
    skip_if_not(require("spam"), message="spam not available for testing dispatching to loaded packages")
    clusterEvalQ(getDefaultCluster(), require("spam"))
                                       
    truebeta <- c(1,2,.2)   
    truetheta <- c(.5,2,.02)
    x <- seq(0,1,l=5)
    locs <- expand.grid(x, x)
    X <- as.matrix(cbind(1,locs)) 
    distmat <- nearest.dist( locs, upper=NULL) 
    Sigma <- cov.sph(distmat, truetheta)    
    set.seed(15)
    y <- c(rmvnorm.spam(1, X %*% truebeta, Sigma))
    mle_optimParallel <- function (y, X, distmat, Covariance, beta0, theta0, thetalower, 
                                   thetaupper, optim.control = NULL, Rstruct = NULL, hessian = FALSE, 
                                   ...) 
    {
        if (!is(Rstruct, "spam.chol.NgPeyton")) {
            Sigma <- do.call(Covariance, list(distmat, c(thetaupper[1], 
                                                         theta0[-1])))
            if (!is.spam(Sigma)) 
                stop("\"Covariance\" should return a spam object.")
            Rstruct <- chol.spam(Sigma, ...)
        }
        p <- dim(X)[2]
        n <- length(y)
        neg2loglikelihood <- function(fulltheta) {
            Sigma <- do.call(Covariance, list(distmat, fulltheta[-(1:p)]))
            cholS <- update.spam.chol.NgPeyton(Rstruct, Sigma)
            resid <- y - X %*% fulltheta[1:p]
            return(n * log(2 * pi) + 2 * c(determinant.spam.chol.NgPeyton(cholS)$modulus) + 
                   sum(resid * solve.spam(cholS, resid)))
        }
        return(optimParallel(c(beta0, theta0), neg2loglikelihood, method = "L-BFGS-B", 
                     control = optim.control, lower = c(rep(-Inf, p), thetalower), 
                     upper = c(rep(Inf, p), thetaupper), hessian = hessian))
    }
    expect_equal(mle.spam(y, X, distmat, cov.sph,
                          truebeta, truetheta,thetalower=c(0,0,0),thetaupper=c(1,Inf,Inf)),
                 mle_optimParallel(y, X, distmat, cov.sph,
                          truebeta, truetheta,thetalower=c(0,0,0),thetaupper=c(1,Inf,Inf)))
 })


