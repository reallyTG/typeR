# HEADER ####################################################
# This is file spam/tests/testthat/test-math.R.             #
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
## library("spam", lib.loc = LIB.LOC)


context("test-math.R")



# see Matrix::rsparsematrix
spam_random <- function(n, m=n, nnz=min(m-1,4)*n, fill=rnorm, seed=NULL, ...)
    {
        if (!is.null(seed)) set.seed(seed)
        ind <- sample.int((n*m), size=nnz)
#
#        as.spam( list(i=(ind %% m)+1, j=(ind %/% n)+1, fill(length(ind), ...)))
        tmp <- matrix(0,n,m)
        tmp[ind] <- fill(length( ind), ...)
        as.spam(tmp)
    }

# construct matrices:
n <- 10
m <- 5

set.seed(14)
tt <- matrix(rnorm(m*n),n,m)
tt[tt<0] <- 0

ss <- as.spam(tt)
options(spam.structurebased=FALSE) # test for equivalence!


#     ‘Math’ ‘"abs"’, ‘"sign"’, ‘"sqrt"’, ‘"ceiling"’, ‘"floor"’,
#          ‘"trunc"’, ‘"cummax"’, ‘"cummin"’, ‘"cumprod"’, ‘"cumsum"’,
#          ‘"log"’, ‘"log10"’, ‘"log2"’, ‘"log1p"’, ‘"acos"’, ‘"acosh"’,
#          ‘"asin"’, ‘"asinh"’, ‘"atan"’, ‘"atanh"’, ‘"exp"’, ‘"expm1"’,
#          ‘"cos"’, ‘"cosh"’, ‘"cospi"’, ‘"sin"’, ‘"sinh"’, ‘"sinpi"’,
#          ‘"tan"’, ‘"tanh"’, ‘"tanpi"’, ‘"gamma"’, ‘"lgamma"’,
#          ‘"digamma"’, ‘"trigamma"’

#     ‘Math2’ ‘"round"’, ‘"signif"’

#     ‘Summary’ ‘"max"’, ‘"min"’, ‘"range"’, ‘"prod"’, ‘"sum"’, ‘"any"’, ‘"all"’

#
# !

test_that("math", {
    A <- diag.spam(4)   ; B <- diag(4)
    spamtest_eq(A, B)
    spamtest_eq(!A, !B)
    diag(A)=0  ; diag(B) <- 0
    spamtest_eq(!A, !B)
                                        # str(A) # is what needs to be expected...,
                                        # different to spam:::complement.spam(A)
})
    
    









test_that("math Summary", {
    expect_equal(max(ss), max(tt))
    expect_equal(min(ss), min(tt))
    expect_equal(range(ss), range(tt))
    expect_equal(prod(ss), prod(tt))
    expect_equal(sum(ss), sum(tt))
    expect_warning(anytt <- any(tt),
                   "coercing argument")
    expect_equal(any(ss), anytt)
    expect_warning(alltt <- all(tt),
                   "coercing argument")
    expect_equal(all(ss), alltt)
})

test_that("Math2", {
    spamtest_eq(round(ss), round(tt))
    spamtest_eq(signif(ss), signif(tt))
    
#     ‘Math’ ‘"abs"’, ‘"sign"’, ‘"sqrt"’, ‘"ceiling"’, ‘"floor"’,
#          ‘"trunc"’, ‘"log1p"’
#          ‘"asin"’, ‘"asinh"’, ‘"atan"’, ‘"atanh"’, ‘"expm1"’,
#           ‘"sin"’, ‘"sinh"’, ‘"sinpi"’,
#          ‘"tan"’, ‘"tanh"’, ‘"tanpi"’,

#          ‘"cummax"’, ‘"cummin"’, ‘"cumprod"’, ‘"cumsum"’,
#          ‘"log"’, ‘"log10"’, ‘"log2"’, ‘"acos"’, ‘"acosh"’,
#          , ‘"exp"’, ‘"cos"’, ‘"cosh"’, ‘"cospi"’
#           ‘"gamma"’, ‘"lgamma"’,   ‘"digamma"’, ‘"trigamma"’


    spamtest_eq(abs(ss), abs(tt))
    spamtest_eq(cos(ss), cos(tt))
    spamtest_eq(cosh(ss), cosh(tt))
    

    options(spam.NAOK=TRUE) # test for equivalence!
    
    expect_equal(suppressWarnings(c(gamma(tt))), suppressWarnings(c(gamma(ss))), rel = FALSE)  #
    expect_equal(c(suppressWarnings(digamma(ss))), suppressWarnings(c(digamma(tt)))) #
    expect_equal(c(trigamma(ss)), c(trigamma(tt)))
    spamtest_eq(exp(ss), exp(tt))
    spamtest_eq(expm1(ss), expm1(tt))
    
    
    expect_equal(c(log(ss)), c(log(tt)))
    spamtest_eq(cummax(ss), cummax(tt))
    
    ## TODO 
    ## for (f in getGroupMembers("Math"))
    ##     spamtest_eq(do.call(f, list(ss)),
    ##                  do.call(f, list(tt)), relative = FALSE)
    
 


    for ( i in c(TRUE, FALSE)) {
        options(spam.structurebased=i) 
        
        set.seed(122)
        S1 <- spam_random(5, nnz=10)
        S2 <- spam_random(5, nnz=10)
        F1 <- as.matrix(S1)
        F2 <- as.matrix(S2)
        
        spamtest_eq(S1+S2, F1+F2)
        spamtest_eq(S1+F2, F1+F2)
        spamtest_eq(F1+S2, F1+F2)
        
        spamtest_eq(S1-S2, F1-F2)
        spamtest_eq(S1-F2, F1-F2)
        spamtest_eq(F1-S2, F1-F2)
        
        S1 <- spam_random(5, nnz=0)
        S2 <- spam_random(5, nnz=10)
        F1 <- as.matrix(S1)
        F2 <- as.matrix(S2)
        
        spamtest_eq(S1+S2, F1+F2)
        spamtest_eq(S1+F2, F1+F2)
        spamtest_eq(F1+S2, F1+F2)
        
        spamtest_eq(S1-S2, F1-F2)
        spamtest_eq(S1-F2, F1-F2)
        spamtest_eq(F1-S2, F1-F2)
    }
})

