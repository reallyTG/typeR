# HEADER ####################################################
# This is file spam/tests/testthat/test-diff.R.             #
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


context("test-diff.R")
     

options(spam.structurebased=FALSE) # test for equivalence!

n <- 10
x <- array(rnorm(n^2),c(n,n))

test_that("diff", {
    spamtest_eq(diff(x), diff(as.spam(x)))
    spamtest_eq(diff(x,d=2), diff(as.spam(x), d=2))
    spamtest_eq(diff(x,d=4), diff(as.spam(x), d=4))
    spamtest_eq(diff(x,2, d=2), diff(as.spam(x),2, d=2))
    expect_equal(diff(x,4, d=4), diff(as.spam(x),4, d=4))
})
