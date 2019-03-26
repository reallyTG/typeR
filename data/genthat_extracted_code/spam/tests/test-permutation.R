# HEADER ####################################################
# This is file spam/tests/testthat/test-permutation.R.      #
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


context("test-permutation.R")


########


set.seed(14)
res <- 12.5


grid <- expand.grid(lat=seq(-90+3*res/2,to=90-res,by=res),lon=seq(res/2,to=360,by=res))
dist <- nearest.dist(grid[,2:1],method='gr',upper=NULL, delta=30,R=1)

distm <- as.matrix(dist)

n <- dim(dist)[1]
perm <- sample.int(n,n)

test_that("permutation.spam", {
    spamtest_eq(permutation.spam(dist,P=perm),distm[order(perm),])
    spamtest_eq(permutation.spam(dist,Q=perm),distm[,order(perm)])
    spamtest_eq(permutation.spam(dist,P=perm,ind=T),distm[perm,])
    spamtest_eq(permutation.spam(dist,Q=perm,ind=T),distm[,perm])
    
    spamtest_eq(permutation(dist,P=perm),distm[order(perm),])
    spamtest_eq(permutation(dist,Q=perm),distm[,order(perm)])
    spamtest_eq(permutation(dist,P=perm,ind=T),distm[perm,])
    spamtest_eq(permutation(dist,Q=perm,ind=T),distm[,perm])
    
    spamtest_eq(permutation(distm,P=perm),distm[order(perm),])
    spamtest_eq(permutation(distm,Q=perm),distm[,order(perm)])
    spamtest_eq(permutation(distm,P=perm,ind=T),distm[perm,])
    spamtest_eq(permutation(distm,Q=perm,ind=T),distm[,perm])
    
    spamtest_eq(t(permutation.spam(t(dist),P=perm)),distm[,order(perm)])
    spamtest_eq(t(permutation(t(dist),P=perm)),distm[,order(perm)])
    spamtest_eq(t(permutation(t(distm),P=perm)),distm[,order(perm)])
})

