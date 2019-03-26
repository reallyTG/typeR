# HEADER ####################################################
# This is file spam/tests/testthat/test-rep_len64.R.        #
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


context("test-rep_len64.R")
    

options(spam.printsize=6)
test_that("rep_len64-force64=FALSE", {
    options(spam.force64=FALSE)
    expect_equal(rep_len(1, 10), spam:::rep_len64(1, 10))
    expect_equal(rep_len(1L, 10L), spam:::rep_len64(1L, 10L))
    expect_equal(rep_len(1:2, 10L), spam:::rep_len64(1:2, 10L))
    expect_equal(rep_len(1:3, 16), spam:::rep_len64(1:3, 16))
})

## test_that("rep_len64-force64=TRUE", {
##     options(spam.force64=TRUE)
##     expect_equal(rep_len(1, 10), spam:::rep_len64(1, 10))
##     expect_equal(rep_len(1L, 10L), spam:::rep_len64(1L, 10L))
##     expect_equal(rep_len(1:2, 10L), spam:::rep_len64(1:2, 10L))
##     expect_equal(rep_len(1:3, 16), spam:::rep_len64(1:3, 16))
## })

