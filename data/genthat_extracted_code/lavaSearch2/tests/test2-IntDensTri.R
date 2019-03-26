### test-intDensTri.R --- 
#----------------------------------------------------------------------
## author: Brice Ozenne
## created: aug 31 2017 (16:32) 
## Version: 
## last-updated: mar 13 2018 (13:24) 
##           By: Brice Ozenne
##     Update #: 15
#----------------------------------------------------------------------
## 
### Commentary: 
## 
### Change Log:
#----------------------------------------------------------------------
## 
### Code:

## * header
rm(list = ls(all.names = TRUE))
if(TRUE){ ## already called in test-all.R
    library(testthat)
    library(lavaSearch2)
}

library(mvtnorm)
lava.options(symbols = c("~","~~"))

context("intDensTri")

## * tests
# {{{ around 0
test_that("Integrate standard gaussian density (2D)", {
    p <- 2
    Sigma <- diag(p)
    mu <- rep(0, p)

    for(n in c(5,10,20,50,100)){ # n <- 5
        res <- intDensTri(mu = mu, Sigma = Sigma, n=n, x.min=0)
        expect_equal(res$value,
                     1/2,
                     tol = 1e-6)
    }
})

test_that("Integrate standard gaussian density (3D)", {
    p <- 3
    Sigma <- diag(p)
    mu <- rep(0, p)

    for(n in c(5,10,20,50,100)){
        res <- intDensTri(mu = mu, Sigma = Sigma, n=n, x.min=0, z.max=10)
        expect_equal(res$value,
                     1/2,
                     tol = 1e-6)
    }
})
# }}}

# {{{ far from 0
test_that("Integrate standard gaussian density (2D)", {
    p <- 2
    Sigma <- diag(p)
    mu <- c(10,0)

    for(n in c(5,10,20,50,100)){
        res <- intDensTri(mu = mu, Sigma = Sigma, n=n, x.min=0)
        expect_equal(res$value,
                     1,
                     tol = 1e-6)
    }
})

test_that("Integrate standard gaussian density (3D)", {
    p <- 3
    Sigma <- diag(p)
    mu <- c(10,0,0)

    for(n in c(5,10,20,50,100)){
        res <- intDensTri(mu = mu, Sigma = Sigma, n=n, x.min=0, z.max=10)
        expect_equal(res$value,
                     1,
                     tol = 1e-6)
    }
})
# }}}


#----------------------------------------------------------------------
### test-intDensTri.R ends here
