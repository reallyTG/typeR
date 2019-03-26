# HEADER ####################################################
# This is file spam/tests/testthat/test-crossprod.R.        #
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


context("test-crossprod.R")
     


options(spam.printsize=60)

######################################################################

test_that("crossprod n=1", {
    set.seed(1)
    
    xf <- rnorm(10)
    xf[xf<0] <- 0
    xs <- as.spam(xf)
    
    yf <- rnorm(10)
    yf[yf<0] <- 0
    ys <- as.spam(yf)
    
    spamtest_eq( crossprod( xf), crossprod.spam( xs))
    spamtest_eq( crossprod( xf, yf), crossprod.spam( xs, ys))
    spamtest_eq( crossprod( xf, yf), crossprod.spam( xs, yf))

    # now dispatching
    spamtest_eq( crossprod( xf), crossprod( xs))
    spamtest_eq( crossprod( xf, yf), crossprod( xs, ys))
    spamtest_eq( crossprod( xf, yf), crossprod( xs, yf))
    
    
    dim(xf) <- c(2,5)
    dim(yf) <- c(2,5)
    ys <- as.spam(yf)
    xs <- as.spam(xf)
    
    spamtest_eq( crossprod( xf, yf), crossprod.spam( xs, ys))
    # now dispatching
    spamtest_eq( crossprod( xf, yf), crossprod( xs, ys))
})

