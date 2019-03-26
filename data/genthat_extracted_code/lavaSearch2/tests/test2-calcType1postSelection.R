### test-calcType1postSelection.R --- 
##----------------------------------------------------------------------
## author: Brice Ozenne
## created: sep 26 2017 (16:54) 
## Version: 
## last-updated: feb 11 2019 (13:45) 
##           By: Brice Ozenne
##     Update #: 23
##----------------------------------------------------------------------
## 
### Commentary: 
## 
### Change Log:
##----------------------------------------------------------------------
##
##
### Code:
## * header
rm(list = ls())
if(TRUE){ ## already called in test-all.R
    library(testthat)
    library(lavaSearch2)
}

library(testthat)
library(mvtnorm)
lava.options(symbols = c("~","~~"))

context("calcType1postSelection")

## * tests
n <- 350

test_that("check type 1 error - unrealistic case with independent statistics", {
    
    p <- 5
    p.all <- 2*p+1
    zp <- qmvnorm(0.95, mean = rep(0,p), sigma = diag(1,p,p), tail = "both.tails")$quantile
    type1Test <- calcType1postSelection(0.95,
                                        quantile.previous = zp,
                                        distribution = "gaussian",
                                        mu = rep(0,p.all),
                                        Sigma = diag(1,p.all,p.all),
                                        correct = FALSE)

    expect_equal(type1Test,0.05, tol = 0.01)
    
})

test_that("check type 1 error - 3 independent tests", {


    #### 3 tests
    Sigma <- diag(1,5,5)
    Sigma[4,2] <- 1
    Sigma[2,4] <- 1
    Sigma[5,3] <- 1
    Sigma[3,5] <- 1
 
    ## no selection since strong effect
    mu <- c(10,0,0,0,0)
    z2 <- qmvnorm(0.975, mean = mu[1:3], sigma = Sigma[1:3,1:3])$quantile

    type1Test <- calcType1postSelection(0.95, quantile.previous = z2,
                                        distribution = "gaussian",
                                        mu = mu, Sigma = Sigma, correct = FALSE)

    expect_equal(type1Test,0.05, tol = 0.01)

    ## conservative type 1 error due to selection
    mu <- c(0,0,0,0,0)
    z2 <- qmvnorm(0.975, mean = mu[1:3], sigma = Sigma[1:3,1:3])$quantile

    type1Test <- calcType1postSelection(0.95, quantile.previous = z2,
                                        distribution = "gaussian",
                                        mu = mu, Sigma = Sigma, correct = FALSE)

    expect_true(type1Test<0.05)
})

#----------------------------------------------------------------------
### test-calcType1postSelection.R ends here
