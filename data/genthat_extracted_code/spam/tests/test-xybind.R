# HEADER ####################################################
# This is file spam/tests/testthat/test-xybind.R.           #
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


context("test-xybind.R")



options(spam.printsize = 60)

######################################################################

test_that("rbind", {
    xn <- 3
    xm <- 2
    yn <- 4
    ym <- 2
    set.seed(14)
    
    X <- array(runif(xn*xm), c( xn,xm))
    Y <- array(runif(yn*ym), c( yn,ym))
    
    R <- as.spam(X)
    S <- as.spam(Y)
    
    ## cat("Testing with two matrices:\n")
    spamtest_eq( rbind( X, Y), rbind.spam( X, Y))
    spamtest_eq( rbind( X, Y), rbind.spam( R, Y))
    spamtest_eq( rbind( X, Y), rbind( R, Y))
    spamtest_eq( rbind( X, Y), rbind.spam( X, S))
    spamtest_eq( rbind( X, Y), rbind.spam( R, S))
    spamtest_eq( rbind( X, Y), rbind( R, S))
    spamtest_eq( rbind( X, Y*0), rbind.spam( X, as.spam(Y*0)))
    spamtest_eq( rbind( X*0, Y), rbind.spam( as.spam(X*0), S))
    spamtest_eq( rbind( X*0, Y*0), rbind.spam( as.spam(X*0), as.spam(Y*0)),rel=F)
    spamtest_eq( rbind( X*0, Y*0), rbind.spam( X*0, Y*0),rel=F)
    
    ## cat("Testing with vectors and scalars:\n")
    spamtest_eq( rbind( X, 1:xm), rbind.spam( X, 1:xm))
    spamtest_eq( rbind( X, 1:xm), rbind.spam( R, 1:xm))
    spamtest_eq( rbind( 1:ym, Y), rbind.spam( 1:ym, S))
    spamtest_eq( rbind( 1, Y), rbind.spam( 1, S))
    
    spamtest_eq( rbind( X, 1), rbind.spam( X, 1))
    
    ## cat("Testing with NULL:\n")
    spamtest_eq( rbind( X, NULL), rbind.spam( X, NULL))
    spamtest_eq( rbind( NULL, X, NULL), rbind.spam( NULL, X, NULL))
    spamtest_eq( rbind( NULL, NULL), rbind.spam( NULL,  NULL),rel=F)
})
######################################################################

######################################################################
test_that("cbind", {
    xn <- 3
    xm <- 2
    yn <- 3
    ym <- 4
    set.seed(14)
    
    X <- array(runif(xn*xm), c( xn,xm))
    Y <- array(runif(yn*ym), c( yn,ym))
    
    R <- as.spam(X)
    S <- as.spam(Y)
    
    ## cat("Testing with two matrices:\n")
    spamtest_eq( cbind( X, Y), cbind.spam( X, Y))
    spamtest_eq( cbind( X, Y), cbind.spam( R, Y))
    spamtest_eq( cbind( X, Y), cbind( R, Y))
    spamtest_eq( cbind( X, Y), cbind.spam( X, S))
    spamtest_eq( cbind( X, Y), cbind.spam( R, S))
    spamtest_eq( cbind( X, Y), cbind( R, S))
    spamtest_eq( cbind( X, Y*0), cbind.spam( X, as.spam(Y*0)))
    spamtest_eq( cbind( X*0, Y), cbind.spam( as.spam(X*0), S))
    spamtest_eq( cbind( X*0, Y*0), cbind.spam( as.spam(X*0), as.spam(Y*0)),rel=F)
    spamtest_eq( cbind( X*0, Y*0), cbind.spam( X*0, Y*0),rel=F)
    
    ## cat("Testing with vectors and scalars:\n")
    spamtest_eq( cbind( X, 1:xn), cbind.spam( X, 1:xn))
    spamtest_eq( cbind( X, 1:xn), cbind.spam( R, 1:xn))
    spamtest_eq( cbind( 1:yn, Y), cbind.spam( 1:yn, S))
    spamtest_eq( cbind( 1, Y), cbind.spam( 1, S))
    
    spamtest_eq( cbind( X, 1), cbind.spam( X, 1))
    
    ## cat("Testing with NULL:\n")
    spamtest_eq( cbind( X, NULL), cbind.spam( X, NULL))
    spamtest_eq( cbind( NULL, X, NULL), cbind.spam( NULL, X, NULL))
    spamtest_eq( cbind( NULL, NULL), cbind.spam( NULL,  NULL),rel=F)
})
