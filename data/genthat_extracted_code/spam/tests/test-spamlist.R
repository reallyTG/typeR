# HEADER ####################################################
# This is file spam/tests/testthat/test-spamlist.R.         #
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


context("test-spamlist.R")


########

test_that("spam.list", {
    spamtest_eq(spam( list(ind=numeric(0), j=numeric(0), numeric(0)),nrow=4,ncol=3),
                spam(0,4,3),rel=FALSE)

    i <- c(1,2,3,4,5)
    j <- c(5,4,3,2,1)
    ss3 <- spam(0,5,5)
    ss3[cbind(i,j)] <- i/j
    spamtest_eq(spam.list(list(i=i,j=j,i/j)), ss3)
    pad(ss3) <- c(13,13)
    spamtest_eq(spam.list(list(i=i,j=j,i/j),13,13), ss3)
    pad(ss3) <- c(3,3)
    spamtest_eq(spam.list(list(i=i,j=j,i/j),3,3), ss3)
    pad(ss3) <- c(2,2)
    spamtest_eq(spam.list(list(i=i,j=j,i/j),2,2), ss3,rel=F)
    
    
    spamtest_eq({options(spam.listmethod='EP');
                 spam.list(list(i=i,j=j,i/j),ncol=3)},
                {options(spam.listmethod='BS');
                 method='BS';spam.list(list(i=i,j=j,i/j),ncol=3)})
    spamtest_eq({options(spam.listmethod='EP');
                 spam.list(list(i=i,j=j,i/j),ncol=3,nrow=4)},
                {options(spam.listmethod='BS');
                 spam.list(list(i=i,j=j,i/j),ncol=3,nrow=4)})
    
    spamtest_eq(spam.list(list(i=i,j=j,i/j),ncol=1,nrow=1),
                0,rel=F)
  
    
    
    set.seed(2011)
    m = 1000
    rmax = 30
    cmax = 40
    i = floor(runif(m) * rmax) + 1
    j = floor(runif(m) * cmax) + 1
    val = floor(10 * runif(m)) + 1
    
    
    options(spam.listmethod='EP')
    ss1 <- spam.list(list(i=i,j=j,val))
    options(spam.listmethod='BS')
    ss2 <- spam.list(list(i=i,j=j,val))
    
    spamtest_eq(ss1,ss2,rel=F)
})

test_that("spam with list", {
    spamtest_eq(spam( list(ind=numeric(0), j=numeric(0), numeric(0)),nrow=4,ncol=3),
                spam(0,4,3),rel=FALSE)

    i <- c(1,2,3,4,5)
    j <- c(5,4,3,2,1)
    ss3 <- spam(0,5,5)
    ss3[cbind(i,j)] <- i/j
    spamtest_eq(spam(list(i=i,j=j,i/j)), ss3)
    pad(ss3) <- c(13,13)
    spamtest_eq(spam(list(i=i,j=j,i/j),13,13), ss3)
    pad(ss3) <- c(3,3)
    spamtest_eq(spam(list(i=i,j=j,i/j),3,3), ss3)
    pad(ss3) <- c(2,2)
    spamtest_eq(spam(list(i=i,j=j,i/j),2,2), ss3,rel=F)
    
    
    spamtest_eq({options(spam.listmethod='EP');
                 spam(list(i=i,j=j,i/j),ncol=3)},
                {options(spam.listmethod='BS');
                 method='BS';spam(list(i=i,j=j,i/j),ncol=3)})
    spamtest_eq({options(spam.listmethod='EP');
                 spam(list(i=i,j=j,i/j),ncol=3,nrow=4)},
                {options(spam.listmethod='BS');
                 spam(list(i=i,j=j,i/j),ncol=3,nrow=4)})
    
    spamtest_eq(spam(list(i=i,j=j,i/j),ncol=1,nrow=1),
                0,rel=F)
  
    
    
    set.seed(2011)
    m = 1000
    rmax = 30
    cmax = 40
    i = floor(runif(m) * rmax) + 1
    j = floor(runif(m) * cmax) + 1
    val = floor(10 * runif(m)) + 1
    
    
    options(spam.listmethod='EP')
    ss1 <- spam(list(i=i,j=j,val))
    options(spam.listmethod='BS')
    ss2 <- spam(list(i=i,j=j,val))
    
    spamtest_eq(ss1,ss2,rel=F)
})
