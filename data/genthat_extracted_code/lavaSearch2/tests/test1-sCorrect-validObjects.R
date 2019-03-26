### test1-sCorrect-validObjects.R --- 
##----------------------------------------------------------------------
## Author: Brice Ozenne
## Created: mar  6 2018 (10:42) 
## Version: 
## Last-Updated: feb 11 2019 (13:44) 
##           By: Brice Ozenne
##     Update #: 63
##----------------------------------------------------------------------
## 
### Commentary: 
## 
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
library(data.table)
library(nlme)
lava.options(symbols = c("~","~~"))
context("sCorrect (warnings and errors for invalid objects/arguments)")

## * Simulation
n <- 100
m.sim <- lvm(Y~X1+X2,G~1)
categorical(m.sim,K=3,label=c("a","b","c")) <- ~G+X2
set.seed(10)
d <- lava::sim(m.sim,n,latent=FALSE)

## * sCorrect for lvm objects

## ** error for multigroup lvm
## check in sCorrect.R 
suppressWarnings(e <- estimate(list(lvm(Y~X1),lvm(Y~X1),lvm(Y~X1)), data = split(d,d$G)))
test_that("error for multigroup models", {
    expect_error(sCorrect(e))
})

## ** error for tobit lvm
## check in sCorrect.R
if(require(lava.tobit)){
    e <- estimate(lvm(G~X1), data = d)
    test_that("error for tobit models", {
        expect_error(sCorrect(e))
    })
}

## ** error for lvm with transform variables
## check in sCorrect.R
m <- lvm(Y~X1)
transform(m,Id~X1) <- function(x){1:NROW(x)}
d.tempo <- lava::sim(m, n)
e <- estimate(m, data = d.tempo)
test_that("error when using transform", {
    expect_error(sCorrect(e))
})

## * sCorrect for nlme objects

## ** warning for the satterthwaite approx. with REML
## check in sCorrect.R 
e <- gls(Y~X1, data = d, correlation = corCompSymm(form =~1|G),
         method = "REML")
test_that("no warning when using no correction", {
    expect_warning(sCorrect(e, df = FALSE, trace = 0) <- FALSE, regexp = NA)
})

## ** warning for the small sample correction estimated with REML
## check in sCorrect.R
e <- gls(Y~X1, data = d, correlation = corCompSymm(form =~1|G))
test_that("warning when using nlme with REML and small sample correction", {
    expect_warning(sCorrect(e, df = FALSE, trace = 0) <- TRUE)
})

## ** error for more than one random effect
## check in Utils-nlme.R (.getVarCov)
e <- lme(Y~X1, random =~ 1|G / X2, data = d, method = "ML")
test_that("error when using nlme with several random effects", {
    expect_error(sCorrect(e, trace = 0))
})

## ** error for more non-standard correlation shape
## check in Utils-nlme.R (.getIndexOmega2)
e <- gls(Y~X1, data = d, correlation = corAR1(form =~1|G), method = "ML")
test_that("error when using nlme with non standard correlation", {
    expect_error(sCorrect(e, trace = 0))
})

## ** error for more non-standard variance shape
## check in Utils-nlme.R (.getIndexOmega2)
e <- gls(Y~X1, data = d, weight = varExp(form =~X1), method = "ML")
test_that("error when using nlme with non standard variance", {
    expect_error(sCorrect(e, cluster = 1:NROW(d), trace = 0))
})


## * sCorrect with data.table

e <- estimate(lvm(Y~X1+X2+G), data = as.data.table(d))
test_that("ok for data.table objects", {
    sCorrect(e) <- FALSE
    sCorrect(e) <- TRUE
})

##----------------------------------------------------------------------
### test1-sCorrect-validObjects.R ends here

