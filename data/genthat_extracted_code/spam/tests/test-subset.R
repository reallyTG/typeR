# HEADER ####################################################
# This is file spam/tests/testthat/test-subset.R.           #
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

context("test-subset.R")




# subsetting:
########################################################################


# construct matrices (should be at least 3x5, with n<m):
n <- 10
m <- 15

set.seed(14)
tt <- matrix(rnorm(m*n),n,m)
tt[tt<0] <- 0

ss <- as.spam(tt)

test_that("subset", {
    spamtest_eq(ss[],tt[])      # ok
    spamtest_eq(ss[,],tt[,])    # ok
    spamtest_eq(ss[1,],tt[1,])  # ok
    spamtest_eq(ss[,2],tt[,2])  # ok
    spamtest_eq(ss[1,3],tt[1,3], relative = FALSE)# ok
    spamtest_eq(ss[3:1,],tt[3:1,])# ok
    
    
    rw <- sample(c(T,F),nrow(tt),rep=T)
    cl <- sample(c(T,F),ncol(tt),rep=T)
    spamtest_eq(ss[rw,cl],tt[rw,cl])
    spamtest_eq(ss[rw],tt[rw])
    
    
    
    
    rw <- c(1,3);cl <- 1:3;
    spamtest_eq(ss[rw,cl],tt[rw,cl])
    spamtest_eq(ss[-rw,cl],tt[-rw,cl])
    spamtest_eq(ss[-rw,-cl],tt[-rw,-cl])
    rw <- c(3,1);cl <- 1:3; spamtest_eq(ss[rw,cl],tt[rw,cl])
    rw <- c(3,1,2,1);cl <- 1:3; spamtest_eq(ss[rw,cl],tt[rw,cl])
    
    tmp <- cbind(sample(1:3,24,rep=T),sample(1:5,24,rep=T))
    spamtest_eq(ss[tmp],tt[tmp])
    
    
    spamtest_eq(diag(10)[1:2,9:10],diag.spam(10)[1:2,9:10],rel=F)
    
    rs <- sample(c(0,1:(2*n)),2*m,replace=T)
    spamtest_eq(ss[rs],tt[rs])
                                        # NAs simply work!
    rs <- sample(c(0,1:(2*n),NA),2*m,replace=T)
    spamtest_eq(ss[rs],tt[rs])
    
    rs <- sample(c(T,F,NA),2*m,replace=T)
    expect_equal(ss[rs],tt[rs])
    
                                        # stuff from 0.31:
    
    tt <- array(1:36,c(6,6))
    ss <- as.spam( tt)
    
    for (i in 1:4) {
        rs <- cbind(rep(1:i,each=i),rep(1:i,i))
        spamtest_eq(ss[rs],tt[rs])
        spamtest_eq(ss[rs+1],tt[rs+1])
        spamtest_eq(ss[rs+2],tt[rs+2])
        
        ti <- array(1:(i^2),c(i,i))
        si <- as.spam( ti)
        spamtest_eq(si[rs],ti[rs])  
        
        si <- spam(0,i,i)
        ti <- as.matrix(si)
        spamtest_eq(si[rs],ti[rs], relative = FALSE)
        
        si <- diag.spam(i)
        ti <- diag(i)
        spamtest_eq(si[rs],ti[rs])
    }
})

## if (F) {
## # large timing example

##   n <- 100
##   m <- 15000

##   set.seed(14)
##   tt <- matrix(rnorm(m*n,mean=-1),n,m)
##   tt[tt<0] <- 0

##   ss <- as.spam(tt)

##   set.seed(14)
##   system.time(for (i in 1:100) {
##     spam:::subset.rows.spam(ss,sample(1:n,10)) })
##   set.seed(14)
##   system.time(for (i in 1:100) {
##     spam:::subset.spam(ss,sample(1:n,10),1:m) })

## }
