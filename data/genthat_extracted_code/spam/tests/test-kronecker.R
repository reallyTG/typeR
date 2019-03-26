# HEADER ####################################################
# This is file spam/tests/testthat/test-kronecker.R.        #
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

## library("testthat", lib.loc = LIB.LOC)
## library("spam64", lib.loc = LIB.LOC)
## library("spam", lib.loc = LIB.LOC)


context("test-kronecker.R")
    

options(spam.printsize=6)

xn <- 3
xm <- 2
yn <- 4
ym <- 2
set.seed(14)

X <- array(runif(xn*xm), c( xn,xm))
Y <- array(runif(yn*ym), c( yn,ym))

R <- as.spam(X)
S <- as.spam(Y)

b <- rnorm(5)

# with matrices

test_that("two matrices:", {
    spamtest_eq( kronecker( X, Y), kronecker.spam( X, Y) )
    spamtest_eq( kronecker( X, Y), kronecker.spam( R, S) )
    
    
    spamtest_eq( kronecker( X, Y), kronecker( R, S) )
    spamtest_eq( kronecker( X, Y), kronecker( R, Y) )
    spamtest_eq( kronecker( X, Y), kronecker( X, S) )
})

test_that("matrix vector", {
    spamtest_eq( kronecker( X, b), kronecker.spam( X, b) )
    spamtest_eq( kronecker( b, Y), kronecker.spam( b, S) )
    
    spamtest_eq( kronecker( X, b), kronecker( R, b) )
    spamtest_eq( kronecker( b, Y), kronecker( b, S) )
})

    
test_that("degenerate cases", {
    spamtest_eq( kronecker( X, 0), kronecker.spam( X, 0),rel=FALSE )
    spamtest_eq( kronecker( 0, 0), kronecker.spam( 0, 0),rel=FALSE  )
    spamtest_eq( kronecker( 0, Y), kronecker( spam(0), Y),rel=FALSE  )
}) 
    
test_that("different operators", {
    spamtest_eq( kronecker(X,Y,FUN="+"),kronecker(R,S,FUN="+"))
    spamtest_eq( kronecker(X,b,FUN="+"),kronecker(R,b,FUN="+"))
    spamtest_eq( kronecker(c(0,1,0),Y,FUN="+"),kronecker(c(0,1,0),S,FUN="+"))
    expect_warning(tmp <- kronecker(diag.spam(2),S,FUN="+"),
                   "Sparseness structure of ")
    spamtest_diff(tmp, kronecker(diag(2),Y,FUN="+"))
})
