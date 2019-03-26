### test2-modelsearch2.R --- 
##----------------------------------------------------------------------
## Author: Brice Ozenne
## Created: jan 22 2018 (11:45) 
## Version: 
## Last-Updated: sep 21 2018 (17:45) 
##           By: Brice Ozenne
##     Update #: 22
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

lava.options(symbols = c("~","~~"))

context("lavaSearch2")

## * example with one additional link
n <- 100
m.sim <- lvm(Y~E+0*X1)
m <- lvm(Y~E)
addvar(m) <- ~X1

set.seed(10)
df.sim <- lava::sim(m.sim, n=100, latent = FALSE)
e.base <- estimate(m, data = df.sim)

test_that("Score 1 link",{
    GS.score <- modelsearch(e.base, silent = TRUE)
    index.coef <- which(GS.score$res[,"Index"]=="Y~X1")

    test.score <- summary(modelsearch2(e.base, method.p.adjust = "holm", trace = 0), print = FALSE)

    ## c("E", "hessian", "varS", "outer", "sandwich", "robust", "num"),   "outer"
    
    expect_equal(as.double(GS.score$test[index.coef,"Test Statistic"]),
                 as.double(test.score$table[1,"statistic"]^2), tol = 1e-9)
    expect_equal(as.double(GS.score$test[index.coef,"P-value"]),
                 as.double(test.score$table[1,"p.value"]), tol = 1e-9)
})


##----------------------------------------------------------------------
### test2-modelsearch2.R ends here
