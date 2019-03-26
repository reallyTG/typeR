### test-mmm2.R --- 
##----------------------------------------------------------------------
## Author: Brice Ozenne
## Created: nov 29 2017 (15:22) 
## Version: 
## Last-Updated: feb 25 2019 (09:37) 
##           By: Brice Ozenne
##     Update #: 116
##----------------------------------------------------------------------
## 
### Commentary: 
## Test battery:
##  - list of linear regressions:
##      Compare multcomp:::glht to lavaSearch2:::glht2 (no small sample adjustment)
##      * standard error derived from the information matrix
##      * robust standard error derived from the iid decomposition
##
##  - latent variable models:
##      Compare multcomp:::glht to lavaSearch2:::glht2 (no small sample adjustment)
##      * standard error derived from the information matrix, with or without second member
##
##  - list of latent variable model (for linear regressions):
##      Compare multcomp:::glht to lavaSearch2:::glht2 (no small sample adjustment)
##      * standard error derived from the information matrix
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

library(multcomp)
library(sandwich)
lava.options(symbols = c("~","~~"))

context("multcomp - mmm")

## * simulation
mSim <- lvm(c(Y1,Y2,Y3,Y4)~ beta * eta, E ~ 1)
latent(mSim) <- "eta"
set.seed(10)
n <- 1e2

df.data <- lava::sim(mSim, n, latent = FALSE, p = c(beta = 1))

## * list of linear regressions
name.Y <- setdiff(endogenous(mSim),"E")
n.Y <- length(name.Y)

ls.formula <- lapply(paste0(name.Y,"~","E"),as.formula)
ls.lm <- lapply(ls.formula, lm, data = df.data)
names(ls.lm) <- name.Y
class(ls.lm) <- "mmm"

test_that("glht vs. glht2 (list lm): information std", {
    e.glht <- glht(ls.lm, mlf("E = 0"))

    resC <- createContrast(ls.lm, var.test = "E", add.variance = TRUE)
    name.all <- colnames(resC$contrast)
    name.mean <- name.all[-grep("sigma",name.all)]

    e.glht2 <- glht2(ls.lm, linfct = resC$contrast,
                     bias.correct = FALSE, robust = FALSE)

    expect_equal(e.glht$vcov,
                 n/(n-2)*e.glht2$vcov[name.mean,name.mean])
    expect_equal(e.glht$coef,e.glht2$coef[names(e.glht$coef)])
    expect_equivalent(e.glht$linfct,e.glht2$linfct[,name.mean])

    eS.glht <- summary(e.glht)
    eS.glht2 <- summary(e.glht2)

    expect_equal(eS.glht$test$tstat, 1/sqrt(n/(n-2))*eS.glht2$test$tstat)
})
     
test_that("glht vs. glht2 (list ml): robust std", {
    e.glht <- glht(ls.lm, mlf("E = 0"), vcov = sandwich)

    resC <- createContrast(ls.lm, var.test = "E", add.variance = TRUE)
    name.all <- colnames(resC$contrast)
    name.mean <- name.all[-grep("sigma",name.all)]
    e.glht2 <- glht2(ls.lm, linfct = resC$contrast,
                     bias.correct = FALSE, robust = TRUE)

    expect_equivalent(e.glht$vcov,
                      e.glht2$vcov[name.mean,name.mean])
    expect_equal(e.glht$coef,e.glht2$coef[name.mean])
    expect_equivalent(e.glht$linfct,e.glht2$linfct[,name.mean])

    eS.glht <- summary(e.glht)
    eS.glht2 <- summary(e.glht2)

    expect_equal(eS.glht$test$tstat, eS.glht2$test$tstat)
    ## cannot compare p.values
    ## because some are based on a student law and others on a gaussian law
})

test_that("glht2 vs. lava (ml): robust std", {
    lsRed.lm <- ls.lm[1:2]
    class(lsRed.lm) <- "mmm"

    resC <- createContrast(lsRed.lm, var.test = "E", add.variance = TRUE)
    name.all <- colnames(resC$contrast)
    name.mean <- name.all[-grep("sigma",name.all)]
    e.glht2 <- glht2(lsRed.lm, linfct = resC$contrast,
                     bias.correct = FALSE, robust = TRUE, df = FALSE)

    GS <- estimate(ls.lm[[1]], cluster = 1:n)$coefmat
    test <- summary(e.glht2, test = adjusted("none"))$test
    
    expect_equal(as.double(test$sigma[1]), GS["E","Std.Err"], tol = 1e-8)
    expect_equal(as.double(test$pvalues[1]), GS["E","P-value"], tol = 1e-8)
    ##
})

test_that("glht vs. calcDistMaxIntegral", {
    e.glht <- glht(ls.lm, mlf("E = 0"), vcov = sandwich)
    res.GS <- summary(e.glht)

    iid.tempo <- do.call(cbind,lapply(ls.lm, iid)) %*% t(e.glht$linfct)
    beta <- unlist(lapply(ls.lm, coef)) %*% t(e.glht$linfct)
    beta.var <- diag(crossprod(iid.tempo))
    z.value <- beta/sqrt(beta.var)
    res.Search <- calcDistMaxIntegral(as.vector(z.value),
                                      iid = iid.tempo, quantile.compute = FALSE,
                                      df = NULL, trace = FALSE, alpha = 0.05)
    
    expect_equal(as.double(res.Search$p.adjust),
                 as.double(res.GS$test$pvalues),
                 tolerance = attr(res.GS$test$pvalues, "error")
                 )
    ## cannot compare p.values
    ## because some are based on a student law and others on a gaussian law
})



## * lvm
## names(df.data)

m.lvm <- lvm(c(Y1,Y2,Y3)~ eta, eta ~ E,
             Y1~Y4)
e.lvm <- estimate(m.lvm, df.data)

test_that("glht vs. glht2 (lvm): information std", {

    resC <- createContrast(e.lvm, par = c("eta~E","Y2=1","Y3=1"))
    e.glht.null <- glht(e.lvm, linfct = resC$contrast)
    e.glht.H1 <- glht(e.lvm, linfct = resC$contrast, rhs = resC$null)

    e.glht2.null <- glht2(e.lvm, linfct = resC$contrast, rhs = rep(0,3),
                          bias.correct = FALSE)
    e.glht2.H1 <- glht2(e.lvm, linfct = resC$contrast, rhs = resC$null,
                        bias.correct = FALSE)


    eS.glht.null <- summary(e.glht.null)
    eS.glht.H1 <- summary(e.glht.H1)
    eS.glht2.null <- summary(e.glht2.null)
    eS.glht2.H1 <- summary(e.glht2.H1)

    expect_equal(unname(eS.glht.null$test$tstat),
                 unname(eS.glht2.null$test$tstat))
    expect_equal(unname(eS.glht.H1$test$tstat),
                 unname(eS.glht2.H1$test$tstat))
    ## cannot compare p.values
    ## because some are based on a student law and others on a gaussian law
})

## * list of lvm
mmm.lvm <- mmm(Y1 = estimate(lvm(Y1~E), data = df.data),
               Y2 = estimate(lvm(Y2~E), data = df.data),
               Y3 = estimate(lvm(Y3~E), data = df.data),
               Y4 = estimate(lvm(Y4~E), data = df.data)
               )

test_that("glht vs. glht2 (list lvm): information std", {

    ##
    resC <- createContrast(mmm.lvm, var.test = "E")
    lvm2.glht <- glht2(mmm.lvm, linfct = resC$contrast,
                       bias.correct = FALSE, robust = FALSE)
    lvm2.sglht <- summary(lvm2.glht)    

    lvm3.glht <- glht2(mmm.lvm, linfct = resC$contrast,
                       rhs = rnorm(4),
                       bias.correct = FALSE, robust = FALSE)
    lvm3.sglht <- summary(lvm3.glht)    

    ##
    lvm.glht <- glht(mmm.lvm, linfct = resC$contrast)
    lvm.glht$df <- NROW(df.data)
    lvm.sglht <- summary(lvm.glht)

    ## compare
    expect_equal(as.numeric(lvm2.sglht$test$coefficients),
                 as.numeric(lvm.sglht$test$coefficients))

    expect_equal(as.numeric(lvm2.sglht$test$sigma),
                 as.numeric(lvm.sglht$test$sigma))

    expect_equal(as.numeric(lvm2.sglht$test$pvalues),
                 as.numeric(lvm.sglht$test$pvalues),
                 tol = attr(lvm.sglht$test$pvalues,"error"))
})

##----------------------------------------------------------------------
### test-mmm2.R ends here
