# HEADER ####################################################
# This is file spam/tests/testthat/test-rowcolstats.R.      #
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


context("test-rowcolstats.R")


# simple tests:
########################################################################


# construct matrices:
n <- 10
m <- 15

set.seed(14)
tt <- matrix(rnorm(m*n),n,m)
tt[tt<0] <- 0

ss <- as.spam(tt)


test_that("rowcolstats", {
    spamtest_eq(rowSums.spam(ss),rowSums(tt)) 
    spamtest_eq(colSums.spam(ss),colSums(tt))
    
    spamtest_eq(rowSums(ss),rowSums(tt)) 
    spamtest_eq(colSums(ss),colSums(tt)) 
    
    
    options(spam.structurebased=FALSE)
    
    spamtest_eq(rowMeans.spam(ss),rowMeans(tt))      
    spamtest_eq(colMeans.spam(ss),colMeans(tt))      
    
    
    spamtest_eq(rowMeans(ss),rowMeans(tt))      
    spamtest_eq(colMeans(ss),colMeans(tt))      
    
    
    
    options(spam.structurebased=TRUE)
    spamtest_eq(rowMeans.spam(ss),rowSums(tt)/apply(tt>0,1,sum))      
    spamtest_eq(colMeans.spam(ss),colSums(tt)/apply(tt>0,2,sum))      

    spamtest_eq(rowMeans(ss),rowSums(tt)/apply(tt>0,1,sum))      
    spamtest_eq(colMeans(ss),colSums(tt)/apply(tt>0,2,sum))      

    
    spamtest_eq(rowMeans.spam(ss),apply.spam(ss,1,mean))      
    spamtest_eq(colMeans.spam(ss),apply.spam(ss,2,mean))          
    
    spamtest_eq(rowMeans(ss),apply.spam(ss,1,mean))      
    spamtest_eq(colMeans(ss),apply.spam(ss,2,mean))      
    
    
    spamtest_eq(rowMeans.spam(spam(0,n,m)),rowMeans(tt*0), relative = FALSE)      
    spamtest_eq(colMeans.spam(spam(0,n,m)),colMeans(tt*0), relative = FALSE)      
    spamtest_eq(rowMeans.spam(as.spam(diag(0,n))),rowMeans(diag(0,n)), relative = FALSE)      
    spamtest_eq(colMeans.spam(as.spam(diag(0,n))),colMeans(diag(0,n)), relative = FALSE)      
    
    spamtest_eq(rowMeans(spam(0,n,m)),rowMeans(tt*0), relative = FALSE)      
    spamtest_eq(colMeans(spam(0,n,m)),colMeans(tt*0), relative = FALSE)      
    spamtest_eq(rowMeans(as.spam(diag(0,n))),rowMeans(diag(0,n)), relative = FALSE)      
    spamtest_eq(colMeans(as.spam(diag(0,n))),colMeans(diag(0,n)), relative = FALSE)      
    
    options(spam.structurebased=TRUE)
})
