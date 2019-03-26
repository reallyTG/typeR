# HEADER ####################################################
# This is file spam/tests/testthat/test-ops.R.              #
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


context("test-ops.R")


# construct matrices:
n <- 10
m <- 5

set.seed(14)
tt <- matrix(rnorm(m*n),n,m)
rr <- matrix(rnorm(m*n),n,m)

tt[tt<0] <- 0
rr[rr>0] <- 0

ss <- as.spam(tt)
qq <- as.spam(rr)
options(spam.structurebased=FALSE) # test for equivalence!

options(spam.NAOK=TRUE) # test for equivalence!


test_that("ops", {
    for (f in rev(getGroupMembers("Arith")))
        spamtest_eq( do.call(f, list(ss,qq)), do.call(f, list(tt,rr)))
    
    for (f in getGroupMembers("Compare"))
        spamtest_eq( do.call(f, list(ss,qq)), do.call(f, list(tt,rr)), relative = FALSE)
    
    for (f in getGroupMembers("Logic"))
        spamtest_eq( do.call(f, list(ss,qq)), do.call(f, list(tt,rr)), relative = FALSE)
    
    
    tv <- sv <- ss@entries
    qv <- qq@entries
    options(spam.structurebased=TRUE)
    
    
    for (g in getGroupMembers("Ops")) {
        for (f in getGroupMembers(g)) {
            expect_equal(do.call(f, list(ss,sv))@entries,
                         as.numeric(do.call(f, list(tv,sv))))
            expect_equal(do.call(f, list(sv,ss))@entries,
                         as.numeric(do.call(f, list(sv,tv))))
            expect_equal(do.call(f, list(ss,4))@entries,
                         as.numeric(do.call(f, list(tv,4))))
        }
    }

    expect_error(do.call(f, list(ss,1:2)))
})
#####################################################################################

test_that("??", {
    options(spam.inefficiencywarning=TRUE)
    options(spam.structurebased=FALSE)
    
    expect_equal(diag(2)+diag.spam(2), diag(rep(2,2)))
})


