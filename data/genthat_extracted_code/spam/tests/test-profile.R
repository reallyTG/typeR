# HEADER ####################################################
# This is file spam/tests/testthat/test-profile.R.          #
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

context("test-profile.R")

test_that(".format.spam()",{
    s <- spam(1)
#    s64 <- spam(1, force64 = TRUE)
   
    expect_identical(spam:::.format.spam(s), spam:::.format32)
#    expect_identical(spam:::.format.spam(s64), spam:::.format64)
#    expect_identical(spam:::.format.spam(s, s64), spam:::.format64)
#    expect_identical(spam:::.format.spam(s, s, s, s64), spam:::.format64)
#    expect_identical(spam:::.format.spam(s64, s64, s64), spam:::.format64)
    expect_identical(spam:::.format.spam(s, s, s), spam:::.format32)

    ## test fallback
    s_corrupt <- s; s_corrupt@colindices <- as.double(s_corrupt@colindices)
    expect_identical(spam:::.format.spam(s_corrupt), spam:::.format32,
                     info = "test fallback")

    ## test if validater is called
    a <- spam(1)
    a@entries[1] <- NA
    expect_warning(spam:::.format.spam(a, validate = TRUE),
                   "Slot 'entries' contains non-finite elements.",
                   info = ".format.spam() and validater")
})


## to be added
## test_that(".validate_spam()",{


## })
