# HEADER ####################################################
# This is file spam/tests/testthat/test-solve.R.            #
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

library("testthat")     
library("spam", lib.loc = LIB.LOC)     

context("test-solve.R")


# construct spd matrices (should be at least 3x3):
n <- 10


set.seed(11)
tt <- matrix(rnorm(n*n),n,n)
tt <- t(tt) %*% tt
tt[tt<0] <- 0
# I have seen that with R version 2.4.0 Patched (2006-11-25 r39997)
# on i486-pc-linux-gnu, tt is not symmetric...
tt <- tt-(tt-t(tt))/2


ss <- as.spam(tt)

css <- chol(ss)
ctt <- chol(tt[ordering(css),ordering(css)])

# solving system
test_that("'solve' and derivatives", {
    b <- rnorm(n)
    
    spamtest_eq(solve(ss),solve(tt))
    spamtest_eq(solve(ss,b),solve(tt,b))
    
    spamtest_eq(t(as.spam(css))%*%as.spam(css), t(ctt)%*%ctt)
    spamtest_eq(t(as.spam(css))%*%as.spam(css), tt[ordering(css),ordering(css)])
    spamtest_eq((t(as.spam(css))%*%as.spam(css))[ordering(css,inv=T),ordering(css,inv=T)], tt)
    
    spamtest_eq(backsolve(css,forwardsolve(css,b[ordering(css,inv=T)]))[ordering(css)],
                backsolve(ctt,forwardsolve(t(ctt),b),n))
#### ,n as patch 
    
    spamtest_eq(backsolve(css,b[ordering(css,inv=T)])[ordering(css)],
                backsolve(ctt,b,n))
#### ,n as patch 
    
    spamtest_eq(forwardsolve(css,b[ordering(css,inv=T)])[ordering(css)],
                forwardsolve(t(ctt),b))
    spamtest_eq(forwardsolve(css,b)[ordering(css)],
                forwardsolve(t(ctt),b[ordering(css)]))
    
    spamtest_eq(forwardsolve(css,tt[ordering(css,inv=T),])[ordering(css),],
                forwardsolve(t(ctt),tt))
})
    
test_that("option 'chol.update'", { 
    ss1 <- ss+diag.spam(dim(ss)[1])
    spamtest_eq( chol(ss), update.spam.chol.NgPeyton(css, ss))
    
    sel <- which(ss[1,,drop=TRUE]!=0)
    ss1[1,sel[-1]] <- 0
    ss2 <- ss
    ss2[n,1] <- .1
    options(spam.cholsymmetrycheck=FALSE)
    spamtest_eq(as.spam(update.spam.chol.NgPeyton(css,ss1)), as.spam( chol(ss1)))
    spamtest_diff(as.spam(update.spam.chol.NgPeyton(css,ss1)), as.spam( chol(ss2)))
})    
    
# spam.options(trivalues=TRUE)
# spam.options(trivalues=FALSE)

options(spam.cholsymmetrycheck=TRUE)

# methods for spam.chol.NgPeyton
test_that("'spam.chol.NgPeyton'", {
    spamtest_eq(as.spam(css), ctt)
    spamtest_eq(as.matrix(css), as.matrix(ctt))
    spamtest_eq(diag(css), diag(ctt))
    spamtest_eq(length(css), length(ctt[ctt!=0]))
    spamtest_eq(dim(css), dim(ctt))
    spamtest_eq(c(css), c(ctt))
})
    
                                       
test_that("option 'cholupdatesingular'\n", {
    ss3 <- spam(rep(1,4),2)
    ch3 <- chol( ss3+diag.spam(2))
    options(spam.cholupdatesingular="null")
    spamtest_eq(is.null(update(ch3, ss3)),TRUE)
    options(spam.cholupdatesingular="warning")
    options(warn=1)
    expect_warning(update(ch3, ss3),
                   "Singularity problem")
    options(spam.cholupdatesingular="error")
    expect_error(update(ch3, ss3),
                 "Singularity problem")
    options(spam.cholupdatesingular="NULL")
    expect_error(update(ch3, ss3),
                 "'cholupdatesingular' should be 'error', 'null' or 'warning'")
})




# determinants
test_that("'det' and derivatives", {
    spamtest_eq(det(ss),det(tt))
    spamtest_eq(det(ss,log=T),det(tt,log=T))
    spamtest_eq(determinant(ss)$mod,determinant(tt)$mod)
    spamtest_eq(determinant(ss,log=F)$mod,determinant(tt,log=F)$mod)
    spamtest_eq(det(chol(ss)),det(chol(tt)))
    spamtest_eq(2*sum(log(diag(css))), determinant(tt)$modulus)
})
    
# orderings and derivatives
test_that("'ordering' and derivatives", {
    tt5 <- matrix(c( 2,0,2,0,4,0,2,0,3),3)
    ss5 <- spam(  c( 2,0,2,0,4,0,2,0,3),3)
    spamtest_eq(ordering(tt5),1:3)
    spamtest_eq(ordering(ss5),1:3)
    spamtest_eq(ordering(tt5,inv=T),3:1)
    spamtest_eq(ordering(ss5,inv=T),3:1)
    spamtest_eq(ordering(chol(ss5)),c(2,3,1))
    spamtest_eq(ordering(chol(ss5),inv=T),c(3,1,2))
})



# spam triangular solves
test_that("triangular solves", { 
    ## We need to generate a upper triangular matrix first.
    ctt <- chol(tt)
    css <- as.spam(ctt)
    b <- rnorm(nrow(tt))

    # a good way to test that we do not use the lower triangular part:
    ctt[2:10,1] <- NA
   
                                        # Recall:
    spamtest_eq(backsolve(ctt,forwardsolve(t(ctt),b),n),
                solve(tt,b))
    
                                        # Now do testing:
    spamtest_eq(forwardsolve(t(css),b), forwardsolve(t(ctt),b))
    
    spamtest_eq(forwardsolve(ss,b), forwardsolve(tt,b))
    
    cs <- ss
    cs[upper.tri(cs)] <- 0
    spamtest_eq(forwardsolve( cs ,b), forwardsolve( ss,b))
    
    
#### ,n as patch 
    spamtest_eq(backsolve(css,b), backsolve(ctt,b, n))
    spamtest_eq(backsolve(ss,b), backsolve(tt,b, n))
    spamtest_eq(backsolve(t(cs),b), backsolve(tt,b, n))
    
    spamtest_eq(backsolve(css,forwardsolve(t(css),b)),
                backsolve(ctt,forwardsolve(t(ctt),b), n))
})

