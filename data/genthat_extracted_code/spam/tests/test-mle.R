# HEADER ####################################################
# This is file spam/tests/testthat/test-mle.R.              #
# It is part of the R package spam,                         #
#  --> https://CRAN.R-project.org/package=spam              #
#  --> https://CRAN.R-project.org/package=spam64            #
#  --> https://git.math.uzh.ch/reinhard.furrer/spam         #
# by Reinhard Furrer [aut, cre], Florian Gerber [aut],      #
#    Roman Flury [aut], Daniel Gerber [ctb],                #
#    Kaspar Moesinger [ctb]                                 #
# HEADER END ################################################
rm(list = ls())     
source("helper.R")

## library("testthat")
## library("spam64", lib.loc = LIB.LOC)
## library("spam", lib.loc = "../../../lib/")


context("test-mle.R")


################## _DO NOT CHANGE THE PARAMETERS_ #################
# Optimization uses these values for a quick run through!!!


truebeta <- c(1,2,.2)
truetheta <- c(.5,2,.02)

spherical <- function(distmat, theta, eps = 1e-06) {
  Sigma <- distmat
  d <- Sigma@entries/theta[1]
 
  Sigma@entries <- ifelse(d < eps,
                          theta[3]+ theta[2],
                          ifelse(d < 1, theta[2]*(1 - 1.5*d + 0.5*d^3), 0))
  return( Sigma)
}
sphericalmat <- function(distmat, theta, eps = 1e-06) {
  Sigma <- distmat
  d <- Sigma@entries/theta[1]
 
  Sigma@entries <- ifelse(d < eps,
                          theta[3]+ theta[2],
                          ifelse(d < 1, theta[2]*(1 - 1.5*d + 0.5*d^3), 0))
  return( as.matrix(Sigma))
}

xl <- 10
x <- seq(0,1,l=xl)
locs <- expand.grid(x,x)
X <- as.matrix(cbind(1,locs))  # design matrix
cov.sph.mat <- function(...)
  as.matrix(cov.sph(...))     # covariance function

distmat <- nearest.dist(locs,upper=NULL) # distance matrix
Sigma <- cov.sph(distmat,truetheta)    # true covariance matrix


set.seed(15)
y <- c(rmvnorm.spam(1,X%*%truebeta,Sigma)) # construct samples


test_that("mle", {
    spamtest_eq(round(neg2loglikelihood.spam( y, X, distmat, cov.sph,
                                             truebeta, truetheta),2), 262.98)
    
    spamtest_eq(round(neg2loglikelihood( y, X, distmat, cov.sph,
                                        truebeta, truetheta),2), 262.98)
    
    spamtest_eq(round(neg2loglikelihood( y, X, distmat, cov.sph.mat,
                                        truebeta, truetheta),2), 262.98)
    
#    spamtest_eq(round(neg2loglikelihood.spam( y, X, distmat, cov.sph.mat,
#                                             truebeta, truetheta),2), 262.98)

#    expect_warning(round(neg2loglikelihood.spam( y, X, distmat, cov.sph.mat,
#                                             truebeta, truetheta),2))
    
})
# we pass now to the mle:

test_that("mle2", {
# not that we should set:
#    ,thetalower=c(0,0,0),thetaupper=c(1,Inf,Inf)
# for quicker testing we use
    res1 <- mle.spam(y, X, distmat, cov.sph,
                     truebeta, truetheta,thetalower=c(0.4,1.5,0.02),thetaupper=c(.6,2.5,.1))
                                        #         truebeta, truetheta,thetalower=c(0,0,0),thetaupper=c(1,Inf,Inf))
    
    betahat <- res1$par[1:3]
    spamtest_eq(round(res1$par,2), c(2.35,  1.45, -0.58,  0.50,  1.70,  0.08))
    spamtest_eq(round(res1$val,2), 259.03)
    
    if (F){ # takes too long...
        res2 <- mle(y, X, distmat, cov.sph,
                    truebeta, truetheta,thetalower=c(0.4,1.5,0.02),thetaupper=c(.6,2.5,.1))
                                        #         truebeta, truetheta,thetalower=c(0,0,0),thetaupper=c(1,Inf,Inf))
        
        res3 <- mle(y, X, distmat, cov.sph.mat,
                    truebeta, truetheta,thetalower=c(0.4,1.5,0.02),thetaupper=c(.6,2.5,.1))
                                        #         truebeta, truetheta,thetalower=c(0,0,0),thetaupper=c(1,Inf,Inf))
        
        
        spamtest_eq(round(res2$par,2), c(2.35,  1.45, -0.58,  0.50,  1.70,  0.08))
        spamtest_eq(round(res2$val,2), 259.03)
        
        spamtest_eq(round(res3$par,2), c(2.35,  1.45, -0.58,  0.50,  1.70,  0.08))
        spamtest_eq(round(res3$val,2), 259.03)
    }
    
    
    res1 <- mle.nomean.spam(y-X%*%betahat, distmat, cov.sph,
                                        #         truetheta,thetalower=c(0,0,0),thetaupper=c(1,Inf,Inf))
                            truetheta,thetalower=c(0.4,1,0.02),thetaupper=c(.6,2.5,.1))

    res2 <- mle.nomean(y-X%*%betahat, distmat, cov.sph,
                       truetheta,thetalower=c(0,0,0),thetaupper=c(1,Inf,Inf))
    
    res3 <- mle.nomean(y-X%*%betahat, distmat, cov.sph.mat,
                       truetheta,thetalower=c(0,0,0),thetaupper=c(1,Inf,Inf))
    
    spamtest_eq(round(res1$par,2), c(  0.50,  1.70,  0.08))
    spamtest_eq(round(res1$val,2), 259.03)
    
    spamtest_eq(round(res2$par,2), c(  0.50,  1.70,  0.08))
    spamtest_eq(round(res2$val,2), 259.03)
    
    spamtest_eq(round(res3$par,2), c(  0.50,  1.70,  0.08))
    spamtest_eq(round(res3$val,2), 259.03)
})

