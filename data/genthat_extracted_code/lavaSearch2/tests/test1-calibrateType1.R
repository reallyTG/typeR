### test1-calibrateType1.R --- 
##----------------------------------------------------------------------
## Author: Brice Ozenne
## Created: apr 10 2018 (09:34) 
## Version: 
## Last-Updated: okt 23 2018 (13:52) 
##           By: Brice Ozenne
##     Update #: 27
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
context("calibrateType1")

## * calibrateType1.lvm
m.generative <- lvm(Y~X1+X2,G~1)
generative.coef <- c("Y" = 0.35,
                     "Y~X1" = 1.5,
                     "Y~X2" = 1.25,
                     "Y~~Y" = 1.14)
true.coef <- c("Y~G" = 0,
               generative.coef)
m.fit <- lvm(Y~X1+X2+G)

test_that("calibrateType1.lvm", {

    out <- calibrateType1(m.fit, true.coef = true.coef,
                          null = c("Y~G"), checkType1 = TRUE,
                          n = c(10,20), n.rep = 2,
                          generative.object = m.generative,
                          generative.coef = generative.coef,
                          dir.save = NULL, F.test = TRUE,
                          bootstrap = FALSE, seed = 10, trace = 0)

    expect_equal(out$p.value[1:2,"p.Ztest"], rep(1.793176e-05,2), tol = 1e-6, scale = 1)
    expect_equal(out$p.value[1:2,"p.robustZtest"], rep(0.0002798229,2), tol = 1e-6, scale = 1)
    expect_equal(out$p.value[1:2,"p.Satt"], rep(0.001588207,2), tol = 1e-6, scale = 1)
    expect_equal(out$p.value[1:2,"p.robustSatt"], rep(0.004587442,2), tol = 1e-6, scale = 1)
    expect_equal(out$p.value[1:2,"p.SSC"], rep(0.0008923767,2), tol = 1e-6, scale = 1)
    expect_equal(out$p.value[1:2,"p.robustSSC"], rep(0.004887758,2), tol = 1e-6, scale = 1)
    expect_equal(out$p.value[1:2,"p.KR"], rep(0.01595612,2), tol = 1e-6, scale = 1)
    expect_equal(out$p.value[1:2,"p.robustKR"], rep(0.03058102,2), tol = 1e-6, scale = 1)

    out2 <- calibrateType1(m.fit, true.coef = true.coef,
                           null = c("Y","Y~X1","Y~G"), checkType1 = FALSE,
                           n = 10, n.rep = 1,
                           generative.object = m.generative,
                           generative.coef = generative.coef,
                           dir.save = NULL, F.test = FALSE,
                           bootstrap = FALSE, seed = 10, trace = 0)
    
    expect_equal(out2$p.value[,"p.Ztest"], c(0.0001021, 0, 1.79e-05), tol = 1e-6, scale = 1)
    expect_equal(out2$p.value[,"p.robustZtest"], c(0.0004781, 1e-07, 0.0002798), tol = 1e-6, scale = 1)
    expect_equal(out2$p.value[,"p.Satt"], c(0.003031, 7.28e-05, 0.0015882), tol = 1e-6, scale = 1)
    expect_equal(out2$p.value[,"p.robustSatt"], c(0.0057983, 0.0002845, 0.0045874), tol = 1e-6, scale = 1)
    expect_equal(out2$p.value[,"p.SSC"], c(0.0026139, 6e-07, 0.0008924), tol = 1e-6, scale = 1)
    expect_equal(out2$p.value[,"p.robustSSC"], c(0.006824, 2.5e-05, 0.0048878), tol = 1e-6, scale = 1)
    expect_equal(out2$p.value[,"p.KR"], c(0.0237056, 0.0024473, 0.0159561), tol = 1e-6, scale = 1)
    expect_equal(out2$p.value[,"p.robustKR"], c(0.0353254, 0.005595, 0.030581), tol = 1e-6, scale = 1)

    ## butils::object2script(out2$p.value[,"p.robustKR"], digit = 7)

})

## * calibrateType1.lvmfit
m2 <- lvm(Y~X1+X2+G)
e <- lava::estimate(m2, lava::sim(m.generative, 1e3))
test_that("calibrateType1.lvmfit", {

    out <- calibrateType1(e, null = c("Y~G"), n.rep = 10, seed = 10, trace = FALSE)
    
    ## butils::object2script(summary(out, display = FALSE), digits = 6)
    GS <- data.frame("n" = c(1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000), 
                     "method" = c("p.Ztest", "p.robustZtest", "p.Satt", "p.robustSatt", "p.SSC", "p.robustSSC", "p.KR", "p.robustKR"), 
                     "link" = c("Y~G", "Y~G", "Y~G", "Y~G", "Y~G", "Y~G", "Y~G", "Y~G"), 
                     "n.rep" = c(10, 10, 10, 10, 10, 10, 10, 10), 
                     "type1error" = c(0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1), 
                     "ci.inf" = c(0.013882, 0.013882, 0.013882, 0.013882, 0.013882, 0.013882, 0.013882, 0.013882), 
                     "ci.sup" = c(0.467237, 0.467237, 0.467237, 0.467237, 0.467237, 0.467237, 0.467237, 0.467237), 
                     "correction" = c("Gaussian approx.", "Gaussian approx.", "Satterthwaite approx.", "Satterthwaite approx.", "small sample correction", "small sample correction", "Satterthwaite approx. with small sample correction", "Satterthwaite approx. with small sample correction"), 
                     "statistic" = c("Wald", "robust Wald", "Wald", "robust Wald", "Wald", "robust Wald", "Wald", "robust Wald"))

    expect_equal(GS$type1error, summary(out, print = FALSE)$type1error, tol = 1e-5, scale = 1)

    #### parallel computation
    ## out <- calibrateType1(e, null = c("Y~G"), n.rep = 1e3, cpus = 4, seed = 10)
    ## res <- summary(out, digit = 5)

    ## GS <- data.frame("n" = c(1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000), 
    ##                  "method" = c("p.Ztest", "p.robustZtest", "p.Satt", "p.robustSatt", "p.SSC", "p.robustSSC", "p.KR", "p.robustKR"), 
    ##                  "link" = c("Y~G", "Y~G", "Y~G", "Y~G", "Y~G", "Y~G", "Y~G", "Y~G"), 
    ##                  "n.rep" = c(1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000), 
    ##                  "type1error" = c(0.050, 0.054, 0.050, 0.053, 0.050, 0.053, 0.050, 0.052), 
    ##                  "ci.inf" = c(0.038095, 0.041587, 0.038095, 0.040712, 0.038095, 0.040712, 0.038095, 0.039839), 
    ##                  "ci.sup" = c(0.065372, 0.069847, 0.065372, 0.068731, 0.065372, 0.068731, 0.065372, 0.067612), 
    ##                  "correction" = c("Gaussian approx.", "Gaussian approx.", "Satterthwaite approx.", "Satterthwaite approx.", "small sample correction", "small sample correction", "Satterthwaite approx. with small sample correction", "Satterthwaite approx. with small sample correction"), 
    ##                  "statistic" = c("Wald", "robust Wald", "Wald", "robust Wald", "Wald", "robust Wald", "Wald", "robust Wald"),
    ##                  stringsAsFactors = FALSE)
    ## butils::object2script(res, digits = 6)
    ## expect_equal(GS$type1error, res$type1error, tol = 1e-5, scale = 1)
})

######################################################################
### test1-calibrateType1.R ends here
