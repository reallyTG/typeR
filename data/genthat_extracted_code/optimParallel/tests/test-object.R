## rm(list=ls())
## library("testthat")
## library("numDeriv")
## library("optimParallel", lib.loc = "../../../lib/")
context("test-object")
source("testsetup.R")
verbose <- FALSE

f1 <- function(x){
#    if(verbose) cat(x, "\n")
    sum(x)
}
f2 <- function(x){
    if(any(x<0)) stop()
    sum(x)
} 
f3 <- function(x){
    if(any(x>0)) stop()
    sum(x)
} 
f4 <- function(x){
    x[1]^2 + (1-x[2])^2+x[3]^3
}
f5 <- function(x){
    x[1]^2 + (1-x[2])^2+log(x[3])
}


test_that("basic",{
    o1 <- optimParallel:::FGgenerator(par=c(1), f1, parallel=list(cl=cl))
    expect_equal(o1$f(1), 1)
    expect_equal(o1$g(1), 1)
    o1 <- optimParallel:::FGgenerator(par=c(4,3), f1, parallel=list(cl=cl))
    expect_equal(o1$f(c(1,1)), 2)
    expect_equal(o1$g(c(1,1)), c(1,1))
    o1 <- optimParallel:::FGgenerator(par=1:3, f1, parallel=list(cl=cl))
    expect_equal(o1$f(c(1,1,2)), 4)
    expect_equal(o1$g(c(1,1,2)), c(1,1,1))
    o1 <- optimParallel:::FGgenerator(par=c(1), f1, gr=f1, parallel=list(cl=cl))
    expect_equal(o1$f(1), 1)
    expect_equal(o1$g(1), 1)
    o1 <- optimParallel:::FGgenerator(par=c(4,3), f1, parallel=list(cl=cl))
    expect_equal(o1$f(c(1,1)), 2)
    expect_equal(o1$g(c(1,1)), c(1,1))
    o1 <- optimParallel:::FGgenerator(par=1:3, f1, parallel=list(cl=cl))
    expect_equal(o1$f(c(1,1,2)), 4)
    expect_equal(o1$g(c(1,1,2)), c(1,1,1))
})


test_that("default args",{
    ff1 <- function(x, a=1){
        sum(x)+a
    }
    o1 <- optimParallel:::FGgenerator(par=c(1), ff1, parallel=list(cl=cl))
    expect_equal(o1$f(1), 2)
    expect_equal(o1$g(1), 1)
    o1 <- optimParallel:::FGgenerator(par=c(1), ff1, a=10, parallel=list(cl=cl))
    expect_equal(o1$f(1), 11)
    expect_equal(o1$g(1), 1)
    ff2 <- function(x, ...){
        sum(x)+list(...)[["a"]]
    }
    o1 <- optimParallel:::FGgenerator(par=c(1), ff2, a=1, parallel=list(cl=cl))
    expect_equal(o1$f(1), 2)
    expect_equal(o1$g(1), 1)
    o1 <- optimParallel:::FGgenerator(par=c(1), ff2, a=10, parallel=list(cl=cl))
    expect_equal(o1$f(1), 11)
    expect_equal(o1$g(1), 1)

    o1 <- optimParallel:::FGgenerator(par=c(1), dnorm, a=1, parallel=list(cl=cl))
    expect_equal(o1$f(2), dnorm(2))
    expect_equal(o1$g(2), (dnorm(2+0.001)-dnorm(2-0.001))/0.002)
    o1 <- optimParallel:::FGgenerator(par=c(1), dnorm, log=TRUE, parallel=list(cl=cl))
    expect_equal(o1$f(2), dnorm(2, log=TRUE))
    expect_equal(o1$g(2), (dnorm(2+0.001, log=TRUE)-dnorm(2-0.001, log=TRUE))/0.002)
})


test_that("bounds",{
    o2 <- optimParallel:::FGgenerator(1, f2, lower=0, parallel=list(cl=cl))
    expect_equal(o2$f(1), 1)
    expect_equal(o2$g(1), 1)
    expect_equal(o2$f(0), 0)
    expect_equal(o2$g(0), 1)
    expect_error(o2$g(-1))

    o3 <- optimParallel:::FGgenerator(1, f3, upper=0, parallel=list(cl=cl))
    expect_equal(o3$f(-1), -1)
    expect_equal(o3$g(-1), 1)
    expect_equal(o3$f(0), 0)
    expect_equal(o3$g(0), 1)
    expect_error(o3$g(1))
})



test_that("derivative",{
    o4 <- optimParallel:::FGgenerator(1:3, f4, parallel=list(cl=cl))
    expect_equal(o4$g(c(1,2,3)), numDeriv::grad(f4, c(1,2,3)),
                 tolerance=1e-3)
    expect_equal(o4$g(c(-1,2,-3.3)), numDeriv::grad(f4, c(-1,2,-3.3)),
                 tolerance=1e-3)
    o4_2 <- optimParallel:::FGgenerator(1:3, f4, forward=TRUE, parallel=list(cl=cl))
    expect_equal(o4_2$g(c(1,2,3)), numDeriv::grad(f4, c(1,2,3)),
                 tolerance=1e-3)
    expect_equal(o4_2$g(c(-1,2,-3.3)), numDeriv::grad(f4, c(-1,2,-3.3)),
                 tolerance=1e-3)
})

test_that("eps",{
    o5 <- optimParallel:::FGgenerator(1:3, f5, ndeps=1e-3, parallel=list(cl=cl))
    expect_equal(o5$g(c(5,6,7)), numDeriv::grad(f5, c(5,6,7)),
                 tolerance=1e-3)
    o5_2 <- optimParallel:::FGgenerator(1:3, f5, ndeps=c(.01,.05,.001), parallel=list(cl=cl))
    expect_equal(o5_2$g(c(5,6,71)),
                 numDeriv::grad(f5, c(5,6,71),
                                method="simple"),
                 tolerance=1e-3)
    o5_3 <- optimParallel:::FGgenerator(1:3, f5, ndeps=c(.01,.05), parallel=list(cl=cl))
    expect_equal(o5_3$g(c(5,6,71)),
                 numDeriv::grad(f5, c(5,6,71),
                                method="simple"),
                 tolerance=1e-3)
})
