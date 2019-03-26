## rm(list=ls())
## library("testthat")
## library("optimParallel", lib.loc = "../../../lib/")
context("test-optimParallel")
source("testsetup.R")

x <- rnorm(1000, 2, .4)
f1 <- function(par, x){
#    print(par)
    -sum(dnorm(x, par[1], par[2], log=TRUE))
}
f2 <- function(par, y){
#    print(y)
    -sum(dnorm(y, par[1], par[2], log=TRUE))
}
f3 <- function(par){
    -sum(par)
}
f4 <- function(par){
   # cat("f:", par, "\n")
#    Sys.sleep(1)
    sum(par^2)
}
g4 <- function(par){
   # cat("g:", par,"\n")
#    Sys.sleep(1)
    2*par
}

f5 <- function(par, a){
   # cat("f:", par, "\n")
#    Sys.sleep(1)
    sum(par^2)+a
}
g5 <- function(par, a){
   # cat("g:", par,"\n")
#    print(a)
                                        #    Sys.sleep(1)
    2*par
}

f6 <- function(par){
    par[1]^2+(1-par[2])^2
}

f7 <- function(x, ...){
    dots <- list(...)
    if(!identical(dots, list()))
        return(sum((x-dots[[1]])^2))
    sum(x^2)
}

f8 <- function(zz, x){
#    print(par)
    -sum(dnorm(x, zz[1], zz[2], log=TRUE))
}

test_that("optimParallel",{
    compareOptim(list(par=c(2,1), fn=f1, x=x, lower=c(-Inf,0.001),
                      control=list(factr=factr)), verbose=verbose)
    compareOptim(list(par=c(2,1), fn=f1, x=x,
                      lower=c(-Inf,0.001),
                      control=list(factr=factr)),
                 parallel=list(forward=TRUE),
                 verbose=verbose, tolerance=1e-2)
    
    compareOptim(list(par=c(12,100), fn=f1, x=x,
                      lower=c(-Inf,0.001),
                      control=list(factr=factr)), verbose=verbose)
    compareOptim(list(par=c(12,100), fn=f1, x=x,
                      lower=c(-Inf,0.001),
                      control=list(factr=factr)),
               parallel=list(forward=TRUE), tolerance=1e-2,
               verbose=verbose)

    compareOptim(list(par=c(12,100), fn=f2, y=x,
                      lower=c(-Inf,0.001),
                      control=list(factr=factr)), verbose=verbose)

    expect_error(optimParallel(par=c(12,100), fn=f2,
                               method = "L-BFGS-B",
                               lower=c(-Inf,0.001),
                               control=list(factr=factr)),
                 "argument \"y\" is missing, with no default")    
})


test_that("bounds",{
    compareOptim(list(par=c(2), fn=f3, 
                      upper = c(10),
                      control=list(factr=factr)),
                 verbose=verbose)
    compareOptim(list(par=c(2), fn=f3, 
                      upper = c(10),
                      control=list(factr=factr)),
                 parallel=list(forward=TRUE),
                 verbose=verbose)

    compareOptim(list(par=c(2,1), fn=f3, 
                      upper = c(10,15),
                      control=list(factr=factr)),
                 verbose=verbose)
    compareOptim(list(par=c(2,1), fn=f3, 
                      upper = c(10,15),
                      control=list(factr=factr)),
                 parallel=list(forward=TRUE),
                 verbose=verbose)

    compareOptim(list(par=c(12,100), fn=function(x) sum(x),
                      lower=c(14,-21),
                      control=list(factr=factr)), verbose=verbose)
    compareOptim(list(par=c(12,100), fn=function(x) sum(x),
                      lower=c(14,-21),
                      control=list(factr=factr)),
                 parallel=list(forward=TRUE), verbose=verbose)
})


test_that("ndeps",{
    compareOptim(list(par=c(2,1), fn=f1, x=x,
                      lower=c(-Inf,0.001),
                      control=list(factr=factr, ndeps=c(.1,.1))),
                 verbose=verbose)

    ## compareOptim(list(par=c(2,1), fn=f1,
    ##                   lower=c(-Inf,0.001),
    ##                   control=list(factr=factr, ndeps=c(.1,.1))),
    ##              parallel=list(forward=TRUE), tolerance=1e-3,
    ##              verbose=verbose)

    compareOptim(list(par=c(12,100), fn=f1, x=x,
                      lower=c(-Inf,0.001),
                      control=list(factr=factr, ndeps=c(.1,.1))),
                 verbose=verbose)
    ## compareOptim(list(par=c(12,100), fn=f1,
    ##                   lower=c(-Inf,0.001),
    ##                   control=list(factr=factr, ndeps=c(.1,.1))),
    ##              parallel=list(forward=TRUE), tolerance=1e-3,
    ##              verbose=verbose)
})


test_that("fnscale",{
    compareOptim(list(par=c(2,1), fn=f1, x=x,
                      lower=c(-Inf,0.001),
                      control=list(factr=factr, fnscale=1000)), verbose=verbose)
    compareOptim(list(par=c(2,1), fn=f1, x=x,
                      lower=c(-Inf,0.001),
                      control=list(factr=factr, fnscale=1000)),
                 parallel=list(forward=TRUE), tolerance=1e-3,
                 verbose=verbose)
})


test_that("parscale",{
    compareOptim(list(par=c(2,1), fn=f1, x=x,
                      lower=c(-Inf,0.001),
                      control=list(factr=factr,
                                   parscale=c(2,4))),
                 verbose=verbose)
    compareOptim(list(par=c(2,1), fn=f1, x=x,
                      lower=c(-Inf,0.001),
                      control=list(parscale=c(2,4), maxit=1)),
                 parallel=list(forward=TRUE), tolerance=1e-2,
                 verbose=verbose)
    
    compareOptim(list(par=c(2,1), fn=f1, x=x, lower=c(-Inf,0.001),
                      control=list(factr=factr, parscale=c(.2,4))), verbose=verbose)
    ## compareOptim(list(par=c(2,1), fn=f1, lower=c(-Inf,0.001),
    ##                   control=list(factr=factr, parscale=c(.2,4))),
    ##              parallel=list(forward=TRUE), tolerance=1e-3, verbose=verbose)
})

test_that("gradient",{
    compareOptim(list(par=c(2), fn=f4, gr=g4,
                      control=list(factr=factr)),
                 verbose=verbose)
    compareOptim(list(par=c(2,1), fn=f4, gr=g4,
                      control=list(factr=factr)),
                 verbose=verbose)
    compareOptim(list(par=c(3,2,1), fn=f4, gr=g4,
                      control=list(factr=factr)),
                 verbose=verbose)
})


test_that("... args",{
    compareOptim(list(par=c(2), fn=f5, gr=g5,
                      control=list(factr=factr), a=1),
                 verbose=verbose)
    compareOptim(list(par=c(2), fn=f5,
                      control=list(factr=factr), a=1),
                 verbose=verbose)
})


