# HEADER ####################################################
# This is file spam/tests/testthat/test-overall.R.          #
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
## library("spam", lib.loc = LIB.LOC)


context("test-overall.R")




options(spam.structurebased = FALSE)

# construct matrices (should be at least 3x5, with n<m):
n <- 10
m <- 15

set.seed(14)
tt <- matrix(rnorm(m*n),n,m)
tt[tt<0] <- 0
tt2 <- matrix(rnorm(m*n),m,n)
tt2[tt2<0] <- 0
tt3 <- t(tt2)
tt4 <- tt  %*% t(tt)

ss <- as.spam(tt)
ss2 <- as.spam(tt2)
ss3 <- as.spam(tt3)
ss4 <- ss  %*% t(ss)


test_that("simple math", {
    kf <- matrix(rnorm(m*n),n,m)
    ks <- as.spam(kf)
    expect_equal(max(ks),max(kf))
    expect_equal(range(ks),range(kf))
    spamtest_eq(log(ks-2*min(ks)),log(kf-2*min(kf)))
    spamtest_eq(cos(ks),cos(kf))
    spamtest_eq(round(ks,2),round(kf,2))
})

test_that("t()", {
    rvec <- 1:n
    spamtest_eq( t(ss), t(tt))
    spamtest_eq( t(matrix(rvec,nrow=1)),t(spam(rvec,nrow=1)))
    spamtest_eq( t(matrix(rvec,ncol=1)),t(spam(rvec,ncol=1)))
})

test_that("add/subtract", {
    spamtest_eq(ss+ss,tt+tt)
    spamtest_eq(ss-ss,tt-tt,rel=FALSE)
    spamtest_eq(ss+tt,tt+tt)
    spamtest_eq(tt+ss,tt+tt)
    spamtest_eq(ss-tt,tt-tt,rel=FALSE)
    spamtest_eq(tt-ss,tt-tt,rel=FALSE)

    spamtest_eq(ss+ss3,tt+tt3)
    spamtest_eq(ss-ss3,tt-tt3)
    spamtest_eq(ss+tt3,tt+tt3)
    
    spamtest_eq(ss+3,tt+3)
    spamtest_eq(ss+ss[,3,drop=T],tt+tt[,3])
    spamtest_eq(ss+tt[,3],tt+tt[,3])
    spamtest_eq(ss+tt[,5],tt+tt[,5])
    
    spamtest_eq(3-ss,3-tt)
    
    spamtest_eq(ss-tt[,3],tt-tt[,3])
    spamtest_eq(ss-tt[,5],tt-tt[,5])
    spamtest_eq(tt[,3]-ss,tt[,3]-tt)
    spamtest_eq(tt[,5]-ss,tt[,5]-tt)
    
    spamtest_eq(-ss,-tt)
    spamtest_eq(+ss,+tt)
})


test_that("multiplication/Division", {
    spamtest_eq(ss*ss,tt*tt)
    spamtest_eq(ss*tt,tt*tt)
    spamtest_eq(tt*ss,tt*tt)
        
    spamtest_eq(ss*ss3,tt*tt3)
    spamtest_eq(ss*ss3,tt*tt3)
    spamtest_eq(ss*tt3,tt*tt3)
    spamtest_eq(tt*ss3,tt*tt3)
    
    spamtest_eq(ss*ss,tt*tt)
    spamtest_eq(ss*tt,tt*tt)
    spamtest_eq(tt*ss,tt*tt)

    spamtest_eq(ss*ss3,tt*tt3)
    spamtest_eq(ss*ss3,tt*tt3)
    spamtest_eq(ss*tt3,tt*tt3)
    spamtest_eq(tt*ss3,tt*tt3)
})

test_that("&,|", { 
    spamtest_eq(ss&ss3,tt&tt3)
    spamtest_eq(ss|ss3,tt|tt3)
    
    ## recall, spam has to be first element
    spamtest_eq(ss&tt3,tt&tt3)
    spamtest_eq(ss|tt3,tt|tt3)
    
    spamtest_eq(ss3&1,tt3&1)
    spamtest_eq(ss3|1,tt3|1)
    spamtest_eq(ss3|0,tt3|0)
})
          
test_that("assign", {
    rw <- 1:3
    cl <- c(1,3)
    
    ss[1,] <- 1;tt[1,] <- 1
    spamtest_eq(ss,tt)
    ss[1,2] <- 1;tt[1,2] <- 1
    spamtest_eq(ss,tt)
    ss[1,] <- 1:m;tt[1,] <- 1:m
    spamtest_eq(ss,tt)
    ss[3:1,] <- 1:m;tt[3:1,] <- 1:m
    spamtest_eq(ss,tt)
    
    set.seed(14)
    rw <- sample(c(T,F),nrow(tt),rep=T)
    cl <- sample(c(T,F),ncol(tt),rep=T)
    ass <- rnorm(sum(rw)*sum(cl))
    ss[rw,cl] <- ass
    tt[rw,cl] <- ass
    
    spamtest_eq(ss[rw,cl],tt[rw,cl])
    
    ss[cbind(1,1)] <- 4;tt[cbind(1,1)] <- 4
    spamtest_eq(ss,tt)
    ss[rbind(dim(ss))] <- 4;tt[rbind(dim(tt))] <- 4
    spamtest_eq(ss,tt)
    
    ss[rbind(c(1,1),dim(ss))] <- c(0.1,0.1);tt[rbind(c(1,1),dim(tt))] <- c(0.1,0.1)
    spamtest_eq(ss,tt)
    
    
    rw <- c(1,3);cl <- 1:3;
    ss[rw,cl] <- 1:3;tt[rw,cl] <- 1:3
    spamtest_eq(ss,tt)
    rw <- c(3,1);cl <- 1:3; 
    ss[rw,cl] <- 1:3;tt[rw,cl] <- 1:3
    spamtest_eq(ss,tt)
    
    nn <- length(tt[-rw,-cl])
    spamtest_eq(ss[-rw,-cl] <- 1:nn,tt[-rw,-cl] <- 1:nn)
    nn <- length(tt[-rw,cl])
    spamtest_eq(ss[-rw,cl] <- 1:nn,tt[-rw,cl] <- 1:nn)
    nn <- length(tt[rw,-cl])
    spamtest_eq(ss[rw,-cl] <- 1:nn,tt[rw,-cl] <- 1:nn)
})
    

test_that("mathstuff", {
    spamtest_eq(sqrt(ss),sqrt(tt))
    
    spamtest_eq(lower.tri.spam(ss),lower.tri(tt)&tt!=0)
    spamtest_eq(lower.tri.spam(ss,F),lower.tri(tt,F)&tt!=0)
    spamtest_eq(upper.tri.spam(ss),upper.tri(tt)&tt!=0)
    spamtest_eq(upper.tri.spam(ss,F),upper.tri(tt,F)&tt!=0)
    
    spamtest_eq(lower.tri(ss),lower.tri(tt)&tt!=0)
    spamtest_eq(lower.tri(ss,F),lower.tri(tt,F)&tt!=0)
    spamtest_eq(upper.tri(ss),upper.tri(tt)&tt!=0)
    spamtest_eq(upper.tri(ss,F),upper.tri(tt,F)&tt!=0)
    

    if (F) {# only works for full matrices
        spamtest_eq(ss/tt,tt/tt)
        spamtest_eq(ss/ss,tt/tt)
        
        kk <- tt/tt
        kk[is.na(kk)] <- 0
        spamtest_eq(ss/tt,kk)
        spamtest_eq(ss/ss,kk)
        
        spamtest_eq(ss^tt,tt^tt)
        spamtest_eq(ss^ss,tt^tt)
    }
    
    ## maybe not all of them make sense
    if (F) { # this need to be discussed
        spamtest_eq(ss2/tt2,tt2/tt2)
        spamtest_eq(ss2^tt2,tt2^tt2)
        spamtest_eq(ss2/ss2,tt2/tt2)
        spamtest_eq(ss2^ss2,tt2^tt2)
    }
})
                                  
test_that("rbind(), cbind()", {
    spamtest_eq(rbind(tt,t(tt2)), rbind.spam(ss,t(ss2)))
    spamtest_eq(rbind(tt,tt,t(tt2),1:ncol(tt)), rbind.spam(ss,ss,t(ss2),t(spam(1:ncol(tt)))))
    
    spamtest_eq(rbind(tt,t(tt2)), rbind(ss,t(ss2)))
    spamtest_eq(rbind(tt,tt,t(tt2),1:ncol(tt)), rbind(ss,ss,t(ss2),t(spam(1:ncol(tt)))))

    
    spamtest_eq(cbind(tt,t(tt2)), cbind.spam(ss,t(ss2)))
    spamtest_eq(cbind(tt,tt,t(tt2),1:nrow(tt)), cbind.spam(ss,ss,t(ss2),spam(1:nrow(tt))))
    
    spamtest_eq(cbind(tt,t(tt2)), cbind(ss,t(ss2)))
    spamtest_eq(cbind(tt,tt,t(tt2),1:nrow(tt)), cbind(ss,ss,t(ss2),spam(1:nrow(tt))))

    expect_error(rbind(ss,ss2))
    expect_error(cbind(ss,ss2))
    if (F) {
                                        # dummy testing
        rbind.spam()
        cbind.spam()
        rbind.spam(deparse.level=0)
        cbind.spam(deparse.level=0)
        
                                        # the following should produce warnings:
        rbind(a=ss)
        cbind(b=ss)
        rbind.spam(deparse.level=1)
        cbind.spam(deparse.level=1)
                                        # the following should produces errors:
     }
})

# testing diag:
test_that("diag() and similar", {
    spamtest_eq(diag(tt),diag(ss))
    spamtest_eq(diag.spam(ss),diag(ss))
    
    spamtest_eq(diag.spam(1:4),diag(1:4))
    spamtest_eq(diag.spam(1,2,3),diag(1,2,3))
    
    spamtest_eq(diag.spam(1:4,4,6),diag(1:4,4,6))
    spamtest_eq(diag.spam(1:4,12),diag(1:4,12))
    
    diag(tt) <- diag(ss) <- 1:n
    spamtest_eq(tt, ss)
    diag(tt) <- diag(ss) <- 2
    spamtest_eq(tt, ss)
    
    diag(tt) <- diag(ss) <- 0
    diag(tt) <- diag(ss) <- 1:n
    spamtest_eq(tt, ss)
    
    spamtest_eq(diag(tt[,5]),diag(ss[,5]))
    spamtest_eq(diag(tt[,5,drop=T]),diag(ss[,5,drop=T]))
    spamtest_eq(diag(tt[,5,drop=F]),diag(ss[,5,drop=F]),rel=F)
})


# testing as.spam
test_that("as.spam() and derivatives", {
    spamtest_eq(as.spam(0), as.matrix(0),rel=FALSE)
    b <- rnorm(n)
    spamtest_eq(as.spam(b), b )
    spamtest_eq(as.spam(-abs(b)), -abs(b) )
    spamtest_eq(-as.spam(abs(b)), -abs(b) )
    spamtest_eq(as.spam(tt), tt)
    
                                        # testing spam
    spamtest_eq(spam(0,1000,1000), matrix(0,1000,1000),rel=FALSE)
    spamtest_eq(spam(1,12,12),matrix(1,12,12))
})

# no NA, NaN, Inf handling
## if (F) { #not implemented
##   ss[2,] <- NA

##   tt[4,] <- NA
##   tt[,4] <- NaN
##   tt[5,] <- Inf
##   as.spam(tt)
## }



# transformation from list and else
test_that("as.spam.list() and triplet()", {
    spamtest_eq( as.spam.list(triplet(ss)), ss)
    spamtest_eq( as.spam.list(triplet(ss, tri=TRUE)), ss)
    
    spamtest_eq( as.spam.list(triplet(tt)), ss)
    spamtest_eq( as.spam.list(triplet(tt, tri=TRUE)), ss)

    spamtest_eq( as.spam(triplet(ss)), ss)
    spamtest_eq( as.spam(triplet(ss, tri=TRUE)), ss)
    
    spamtest_eq( as.spam(triplet(tt)), ss)
    spamtest_eq( as.spam(triplet(tt, tri=TRUE)), ss)

  expect_error(spam.list( list(i=1, 2)))
  expect_error(spam.list( list(ind=1, 2)))
  expect_error(spam.list( list(ind=1, 1, 2)))
  expect_error(spam.list( list(ind=1, j=0, 2)))
  #spam.list( list(ind=numeric(0), j=numeric(0), numeric(0))))
})
