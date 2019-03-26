# HEADER ####################################################
# This is file spam/tests/testthat/test-helper.R.           #
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


context("test-helper.R")



########


set.seed(14)

# bdiag.spam:

A <- spam(rnorm(10),2)
B <- spam(rnorm(16),4)

test_that("bdiag.spam", {
    spamtest_eq( bdiag.spam(A),A)
    
    spamtest_eq( bdiag.spam(A,B),rbind(cbind(A,rep(0,8)),
                                       cbind(spam(rep(0,20),4),B)))
}) 


n <- 5
Sigma <- .25^abs(outer(1:n,1:n,'-'))
Q <- as.spam(solve(Sigma))
b <- 1:n

struct <- chol(Q)

test_that("rmvnorm", {
    set.seed(14)
    tmp1 <- rmvnorm.canonical(10, b, Q) 
    set.seed(14)
    spamtest_eq( rmvnorm.canonical(10, b, Q, Lstruct=struct), tmp1 )
    set.seed(14)
    spamtest_eq( rmvnorm.prec(10, solve(Q,b), Q), tmp1 )
    set.seed(14)
    spamtest_eq( rmvnorm.prec(10, solve(Q,b), Q, Lstruct=struct), tmp1 )
    set.seed(14)
    ## cat("For rmvnorm.canonical:\n- comparing sample mean with truth:\n")
    ## for (i in 10^(1:4))
    ##     cat('    sample size n=',i,' yields  Frobenius-norm:',
    ##         norm( apply(rmvnorm.canonical(i, b, Q, Lstruct=struct), 2,mean)- solve(Q,b),'f'),'\n')
    ## cat("- comparing sample variance with truth:\n")
    ## for (i in 10^(1:4)){
    ##     cat('    sample size n=',i,' yields Frobenius-norm:',
    ##         norm( var( rmvnorm.canonical(i, b, Q=Q, Lstruct=struct))- Sigma,'f'),'\n')
    ## set.seed(14)
    ## cat("For rmvnorm.prec:\n- comparing sample mean with truth:\n")
    ## for (i in 10^(1:4))
    ##     cat('    sample size n=',i,' yields  Frobenius-norm:',
    ##         norm( apply(rmvnorm.prec(i, b, Q, Lstruct=struct), 2,mean)- b,'f'),'\n')
    ## cat("- comparing sample variance with truth:\n")
    ## for (i in 10^(1:4)){
    ##     cat('    sample size n=',i,' yields Frobenius-norm:',
    ##         norm( var( rmvnorm.prec(i, Q=Q, Lstruct=struct))- Sigma,'f'),'\n')
    ## }
    ## set.seed(14)
    ## cat("For rmvnorm.spam:\n- comparing sample mean with truth:\n")
    ## for (i in 10^(1:4))
    ##   cat('    sample size n=',i,' yields  Frobenius-norm:',
    ##       norm( apply(rmvnorm.spam(i, b, as.spam(Sigma), Lstruct=struct), 2,mean)- b,'f'),'\n')
    ## cat("- comparing sample variance with truth:\n")
    ## for (i in 10^(1:4)){
    ##   cat('    sample size n=',i,' yields Frobenius-norm:',
    ##       norm( var( rmvnorm.spam(i, b, as.spam(Sigma), Lstruct=struct))- Sigma,'f'),'\n')
    ## }
})
