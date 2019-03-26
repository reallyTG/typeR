### test1-cluster.R --- 
##----------------------------------------------------------------------
## Author: Brice Ozenne
## Created: apr 26 2018 (10:37) 
## Version: 
## Last-Updated: feb 11 2019 (11:03) 
##           By: Brice Ozenne
##     Update #: 6
##----------------------------------------------------------------------
## 
### Commentary: 
## Check that the robust standard error of lavaSearch2 matches those of lava
### Change Log:
##----------------------------------------------------------------------
## 
### Code:

## * header
rm(list = ls())
if(FALSE){ ## already called in test-all.R
    library(testthat)
    library(lavaSearch2)
}

lava.options(symbols = c("~","~~"))
context("cluster argument (replicate lava results)")

## * simulation
n <- 2e1
mSim <- lvm(c(Y1~eta1,Y2~eta1+X2,Y3~eta1+X1,
           Z1~eta2,Z2~eta2,Z3~eta2+X3))
regression(mSim) <- eta1~X1+Gender
latent(mSim) <- ~eta1+eta2
categorical(mSim, labels = c("Male","Female")) <- ~Gender
transform(mSim, Id~Y1) <- function(x){round(runif(n = n, min = 0, max = 30))}
set.seed(10)
d <- lava::sim(mSim, n = n, latent = FALSE)
table(d$Id)

## * linear regression [lvm]
## ** model fit and sCorrect
test_that("lm - robust vcov",{
    e.lvm <- estimate(lvm(Y1~X1+X2+Gender), data = d)
    sCorrect(e.lvm) <- FALSE
    eR.lvm <- estimate(lvm(Y1~X1+X2+Gender), data = d, cluster ="Id")
    
    n.Id <- length(unique(d$Id))
    GS <- vcov(eR.lvm)/(n.Id/(n.Id-1))
    test <- crossprod(iid2(e.lvm, cluster = "Id"))
    expect_true(all(abs(GS/test-1)<1e-2))
    ## GS/test

    summary(eR.lvm)$coef
    compare2(e.lvm, par = c("Y1~X1"),
             robust = TRUE, cluster = "Id")
##    compare2(e.lvm, par = c("Y1~X1"))
})

######################################################################
### test1-cluster.R ends here
