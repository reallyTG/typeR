### test1-sCorrect-dVcov.R --- 
##----------------------------------------------------------------------
## Author: Brice Ozenne
## Created: mar  8 2018 (14:56) 
## Version: 
## Last-Updated: feb 11 2019 (13:43) 
##           By: Brice Ozenne
##     Update #: 114
##----------------------------------------------------------------------
## 
### Commentary: 
## 
### Change Log:
##----------------------------------------------------------------------
## 
### Code:

## * header
## rm(list = ls())
if(FALSE){ ## already called in test-all.R
    library(testthat)
    library(lavaSearch2)
}

lava.options(symbols = c("~","~~"))
library(nlme)
context("sCorrect (dVcov-SatterthwaiteCorrection)")

## * simulation
n <- 5e1
mSim <- lvm(c(Y1~eta1,Y2~eta1+X2,Y3~eta1+X1,
              Z1~eta2,Z2~eta2,Z3~eta2+X3))
regression(mSim) <- eta1~X1+Gender
latent(mSim) <- ~eta1+eta2
categorical(mSim, labels = c("Male","Female")) <- ~Gender
transform(mSim, Id~Y1) <- function(x){1:NROW(x)}
set.seed(10)
d <- lava::sim(mSim, n = n, latent = FALSE)
dL <- reshape2::melt(d, id.vars = c("Id","X1","X2","X3","Gender"),
                     measure.vars = c("Y1","Y2","Y3","Z1","Z2","Z3"))
dLred <- dL[dL$variable %in% c("Y1","Y2","Y3"),]

## * linear regression [lm,gls,lvm]
## ** model fit
e.lvm <- estimate(lvm(Y1~X1+X2+Gender), data = d)
e.lm <- lm(Y1~X1+X2+Gender, data = d)
e.gls <- gls(Y1~X1+X2+Gender, data = d, method = "ML")

## ** check dVcov
test_that("linear regression: Satterthwaite", {
    X <- model.matrix(e.lm)
    sigma2 <- coef(e.lvm)["Y1~~Y1"]
    dI <- bdiag(crossprod(X)/sigma2^2,n/(sigma2^3))
    vcov <- solve(bdiag(crossprod(X)/sigma2,n/(2*sigma2^2)))
    GS <- vcov %*% dI %*% vcov

    test.lvm <- sCorrect(e.lvm, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = FALSE)$dVcov.param
    GS.lvm <- sCorrect(e.lvm, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = TRUE)$dVcov.param
    expect_equal(test.lvm, GS.lvm)
    expect_equal(as.double(test.lvm), as.double(GS))

    test.lm <- sCorrect(e.lm, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = FALSE)$dVcov.param
    GS.lm <- sCorrect(e.lm, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = TRUE)$dVcov.param
    expect_equal(test.lm, GS.lm)
    expect_equal(as.double(test.lm), as.double(GS))

    test.gls <- sCorrect(e.gls, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = FALSE, cluster = "Id")$dVcov.param
    GS.gls <- sCorrect(e.gls, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = TRUE, cluster = "Id")$dVcov.param
    expect_equal(test.gls, GS.gls)
    expect_equal(as.double(test.gls), as.double(GS))
})

## ** check dVcov (Satterthwaite + small sample correct) [should be moved to another file]
test_that("linear regression: Satterthwaite + small sample correction (dVcov))", {
    X <- model.matrix(e.lm)
    sigma2 <- sigma(e.lm)^2
    dI <- bdiag(crossprod(X)/sigma2^2,(n-NCOL(X))/(sigma2^3))
    vcov <- solve(bdiag(crossprod(X)/sigma2,(n-NCOL(X))/(2*sigma2^2)))
    GS <- vcov %*% dI %*% vcov

    test.lvm <- sCorrect(e.lvm, adjust.Omega = TRUE, adjust.n = TRUE, numeric.derivative = FALSE)$dVcov.param
    expect_equal(as.double(test.lvm), as.double(GS), tol = 1e-5)

    test.lm <- sCorrect(e.lm, adjust.Omega = TRUE, adjust.n = TRUE, numeric.derivative = FALSE)$dVcov.param
    expect_equal(as.double(test.lm), as.double(GS), tol = 1e-5)
    test.gls <- sCorrect(e.gls, adjust.Omega = TRUE, adjust.n = TRUE, numeric.derivative = FALSE, cluster = "Id")$dVcov.param
    expect_equal(as.double(test.gls), as.double(GS), tol = 1e-5)
})

## * linear regression with constrains [lvm]
## ** model fit
e.lvm <- estimate(lvm(Y1[0:2]~X1+1*X2), data = d)

e.lvm2 <- estimate(lvm(Y1~beta*X1+beta*X2), d)

## ** check dVcov
test_that("linear regression with constrains: Satterthwaite (dVcov)", {
    test.lvm <- sCorrect(e.lvm, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = FALSE)$dVcov.param
    GS.lvm <- sCorrect(e.lvm, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = TRUE)$dVcov.param
    expect_equal(test.lvm, GS.lvm)

    test.lvm2 <- sCorrect(e.lvm2, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = FALSE)$dVcov.param
    GS.lvm2 <- sCorrect(e.lvm2, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = TRUE)$dVcov.param
    expect_equal(test.lvm2, GS.lvm2)    
})

## * multiple linear regression [lvm,gls]
## ** model fit
ls.lm <- list(lm(Y1~X1,d),lm(Y2~X2,d),lm(Y3~X1+X3,d))
e.lvm <- estimate(lvm(Y1~X1,Y2~X2,Y3~X1+X3), data = d)

e.lvm2 <- estimate(lvm(Y1[mu:sigma1]~ beta1*X1 + beta2*X2,
                       Y2[mu:sigma2]~ beta1*X1 + beta2*X2,
                       Y3[mu:sigma3]~ beta1*X1 + beta2*X2),
                       data = d)
e.gls <- gls(value ~ X1 + X2,
             data = dL[dL$variable %in% c("Y1","Y2","Y3"),],
             weight = varIdent(form = ~1|variable),
             method = "ML")

test_that("gls equivalent to lvm", {
    expect_equal(as.double(logLik(e.lvm2)), as.double(logLik(e.gls)))
})

## ** check dVcov (Satterthwaite)
test_that("multiple linear regression: Satterthwaite (dVcov)", {
    X <- lapply(ls.lm, model.matrix)
    sigma2 <- list(coef(e.lvm)["Y1~~Y1"],
                   coef(e.lvm)["Y2~~Y2"],
                   coef(e.lvm)["Y3~~Y3"])
    dI <- mapply(X,sigma2, FUN = function(x,y){
        bdiag(crossprod(x)/y^2,n/(y^3))
    })
    vcov <- mapply(X,sigma2, FUN = function(x,y){
        solve(bdiag(crossprod(x)/y,n/(2*y^2)))
    })
    GS <- mapply(vcov, dI, FUN = function(x,y){
        x %*% y %*% x
    })
    name.coef.lvm <- names(coef(e.lvm))
    
    test.lvm <- sCorrect(e.lvm, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = FALSE)$dVcov.param
    GS.lvm <- sCorrect(e.lvm, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = TRUE)$dVcov.param
    expect_equal(test.lvm, GS.lvm)
    expect_equal(as.double(test.lvm[grep("Y1",name.coef.lvm),grep("Y1",name.coef.lvm),"Y1~~Y1"]),
                 as.double(GS[[1]]))
    expect_equal(as.double(test.lvm[grep("Y2",name.coef.lvm),grep("Y2",name.coef.lvm),"Y2~~Y2"]),
                 as.double(GS[[2]]))
    expect_equal(as.double(test.lvm[grep("Y3",name.coef.lvm),grep("Y3",name.coef.lvm),"Y3~~Y3"]),
                 as.double(GS[[3]]))

    test.gls <- sCorrect(e.gls, adjust.Omega = FALSE, adjust.n = FALSE,
                         numeric.derivative = FALSE, cluster = "Id")$dVcov.param
    GS.gls <- sCorrect(e.gls, adjust.Omega = FALSE, adjust.n = FALSE,
                       numeric.derivative = TRUE, cluster = "Id")$dVcov.param
    expect_equal(test.gls, GS.gls)    
})

## ** multiple linear regression (Satterthwaite + small sample correct) [should be moved to another file]
test_that("multiple linear regression: Satterthwaite + small sample correction (dVcov)", {
    X <- lapply(ls.lm, model.matrix)
    sigma2 <- lapply(ls.lm, function(x){sigma(x)^2})
    dI <- mapply(X,sigma2, FUN = function(x,y){
        bdiag(crossprod(x)/y^2,(n-NCOL(x))/(y^3))
    })
    vcov <- mapply(X,sigma2, FUN = function(x,y){
        solve(bdiag(crossprod(x)/y,(n-NCOL(x))/(2*y^2)))
    })
    GS <- mapply(vcov, dI, FUN = function(x,y){
        x %*% y %*% x
    })
    name.coef.lvm <- names(coef(e.lvm))

    test.lvm <- sCorrect(e.lvm, adjust.Omega = TRUE, adjust.n = TRUE, numeric.derivative = FALSE)$dVcov.param
    expect_equal(as.double(test.lvm[grep("Y1",name.coef.lvm),grep("Y1",name.coef.lvm),"Y1~~Y1"]),
                 as.double(GS[[1]]))
    expect_equal(as.double(test.lvm[grep("Y2",name.coef.lvm),grep("Y2",name.coef.lvm),"Y2~~Y2"]),
                 as.double(GS[[2]]))
    expect_equal(as.double(test.lvm[grep("Y3",name.coef.lvm),grep("Y3",name.coef.lvm),"Y3~~Y3"]),
                 as.double(GS[[3]]))

    test.gls <- sCorrect(e.gls, adjust.Omega = TRUE, adjust.n = TRUE, numeric.derivative = FALSE, cluster = "Id")$dVcov.param
    
})

## * multiple linear regression with constrains [lvm]
## ** model fit
e.lvm <- estimate(lvm(Y1~X1+1*X2,Y2~2*X3+2*X1,Y3~X2), data = d)

## ** check dVcov
test_that("multiple linear regression with constrains: Satterthwaite", {
    test.lvm <- sCorrect(e.lvm, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = FALSE)$dVcov.param
    GS.lvm <- sCorrect(e.lvm, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = TRUE)$dVcov.param
    expect_equal(test.lvm, GS.lvm)
})


## * multiple linear regression with covariance links [lvm]
## ** model fit
e.lvm <- estimate(lvm(Y1~X1+X2,Y2~X3+X1,Y3~X2,Y1~~Y2),d)

## ** check dVcov
test_that("multiple linear regression with covariance: Satterthwaite (dVcov)", {
    test.lvm <- sCorrect(e.lvm, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = FALSE)$dVcov.param
    GS.lvm <- sCorrect(e.lvm, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = TRUE)$dVcov.param
    expect_equal(test.lvm, GS.lvm)
})


## * mixed model: Compound symmetry [lvm,gls,lme]
## ** model fit
m <- lvm(Y1[mu1:sigma]~1*eta,
         Y2[mu2:sigma]~1*eta,
         Y3[mu3:sigma]~1*eta,
         eta~X1+Gender)
e.lvm <- estimate(m, d)

e.lme <- lme(value ~ variable + X1 + Gender,
             random =~ 1|Id,
             data = dLred,
             method = "ML")

e.gls <- gls(value ~ variable + X1 + Gender,
             correlation = corCompSymm(form=~ 1|Id),
             data = dLred,
             method = "ML")

test_that("compound symmetry: lme/gls equivalent to lvm",{
    expect_equal(as.double(logLik(e.lme)),as.double(logLik(e.lvm)))
    expect_equal(as.double(logLik(e.gls)),as.double(logLik(e.lvm)))
})


## ** check dVcov
test_that("compound symmetry: Satterthwaite (dVcov)", {
    test.lvm <- sCorrect(e.lvm, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = FALSE)$dVcov.param
    GS.lvm <- sCorrect(e.lvm, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = TRUE)$dVcov.param
    expect_equal(test.lvm, GS.lvm)
    expect_equal(c(min(test.lvm),mean(test.lvm),max(test.lvm)),
                 c(-0.043665672, 0.001141085, 0.086044394),
                 tol = 1e-8) ## compare with previous version
   
    test.lme <- sCorrect(e.lme, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = FALSE)$dVcov.param
    GS.lme <- sCorrect(e.lme, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = TRUE)$dVcov.param
    expect_equal(test.lme, GS.lme)
   
    test.gls <- sCorrect(e.gls, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = FALSE)$dVcov.param
    GS.gls <- sCorrect(e.gls, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = TRUE)$dVcov.param
    expect_equal(test.gls, GS.gls)
})

## * mixed model: CS with different variances [lvm,lme]
## ** model fit 
m <- lvm(c(Y1[mu1:sigma1]~1*eta,
           Y2[mu2:sigma2]~1*eta,
           Y3[mu3:sigma3]~1*eta,
           eta~X1+Gender))
latent(m) <- ~eta
e.lvm <- estimate(m, d)

e.lme <- nlme::lme(value ~ variable + X1 + Gender,
                   random =~1| Id,
                   weights = varIdent(form =~ 1|variable),
                   data = dLred, method = "ML")

e.gls <- nlme::gls(value ~ variable + X1 + Gender,
                   correlation = corCompSymm(form = ~1| Id),
                   weights = varIdent(form =~ 1|variable),
                   data = dLred, method = "ML")

test_that("lme equivalent to lvm", {
    expect_equal(as.double(logLik(e.lvm)), as.double(logLik(e.lme)))
    ## gls does not give the same likelihood
    ## expect_equal(as.double(logLik(e.gls)), as.double(logLik(e.lme)))
})

## ** check dVcov
test_that("compound symmetry with different variances: Satterthwaite (dVcov)", {
    test.lvm <- sCorrect(e.lvm, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = FALSE)$dVcov.param
    GS.lvm <- sCorrect(e.lvm, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = TRUE)$dVcov.param
    expect_equal(test.lvm, GS.lvm) ## internal consistency
    expect_equal(c(min(test.lvm),mean(test.lvm),max(test.lvm)),
                 c(-0.043665672, 0.001163405, 0.158962412),
                 tol = 1e-8) ## compare with previous version
    
    test.lme <- sCorrect(e.lme, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = FALSE)$dVcov.param
    GS.lme <- sCorrect(e.lme, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = TRUE)$dVcov.param
    expect_equal(test.lme, GS.lme)

    test.gls <- sCorrect(e.gls, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = FALSE)$dVcov.param
    GS.gls <- sCorrect(e.gls, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = TRUE)$dVcov.param
    expect_equal(test.gls, GS.gls)
})


## * mixed model: Unstructured [lvm,gls,lme]
## ** model fit 
m <- lvm(Y1[mu1:sigma]~1*eta,
         Y2[mu2:sigma]~1*eta,
         Y3[mu3:sigma]~1*eta,
         eta~X1+Gender)
covariance(m) <- Y1~Y2
covariance(m) <- Y1~Y3
e.lvm <- estimate(m, d)

e.lme <- lme(value ~ variable + X1 + Gender,
             random =~ 1|Id,
             correlation = corSymm(),
             ## weights = varIdent(form =~ 1|variable),
             data = dLred,
             method = "ML")

e.gls <- gls(value ~ variable + X1 + Gender,
             correlation = corSymm(form=~ 1|Id),
             ## weights = varIdent(form =~ 1|variable),
             data = dLred,
             method = "ML")

test_that("lme/gls equivalent to lvm", {
    expect_equal(as.double(logLik(e.lvm)), as.double(logLik(e.lme)))
    expect_equal(as.double(logLik(e.gls)), as.double(logLik(e.lme)))
})

## ** check dVcov
test_that("Unstructured: Satterthwaite (dVcov)", {
    test.lvm <- sCorrect(e.lvm, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = FALSE)$dVcov.param
    GS.lvm <- sCorrect(e.lvm, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = TRUE)$dVcov.param
    expect_equal(test.lvm, GS.lvm)
    expect_equal(c(min(test.lvm),mean(test.lvm),max(test.lvm)),
                 c(-0.069511713, 0.001092602, 0.129487510),
                 tol = 1e-8) ## compare with previous version
    ## ERROR: inversion?
    ## test.lme <- sCorrect(e.lme, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = FALSE)$dVcov.param
    ## GS.lme <- sCorrect(e.lme, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = TRUE)$dVcov.param
    ## expect_equal(test.lme, GS.lme)

    test.gls <- sCorrect(e.gls, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = FALSE)$dVcov.param
    GS.gls <- sCorrect(e.gls, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = TRUE)$dVcov.param
    expect_equal(test.gls, GS.gls)
})


## * mixed model: Unstructured with weights [lvm,gls,lme]
## ** model fit
m <- lvm(Y1~1*eta,
         Y2~1*eta,
         Y3~1*eta,
         eta~X1+Gender)
covariance(m) <- Y1~Y2
covariance(m) <- Y1~Y3
e.lvm <- estimate(m, d)

e.lme <- lme(value ~ variable + X1 + Gender,
             random =~ 1|Id,
             correlation = corSymm(),
             weights = varIdent(form =~ 1|variable),
             data = dLred,
             method = "ML")

e.gls <- gls(value ~ variable + X1 + Gender,
             correlation = corSymm(form=~ 1|Id),
             weights = varIdent(form =~ 1|variable),
             data = dLred,
             method = "ML")

test_that("lme/gls equivalent to lvm", {
    expect_equal(as.double(logLik(e.lvm)), as.double(logLik(e.lme)))
    expect_equal(as.double(logLik(e.gls)), as.double(logLik(e.lme)))
})

## ** check dVcov
test_that("Unstructured with different variances: Satterthwaite (dVcov)", {
    test.lvm <- sCorrect(e.lvm, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = FALSE)$dVcov.param
    GS.lvm <- sCorrect(e.lvm, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = TRUE)$dVcov.param
    expect_equal(test.lvm, GS.lvm)
    expect_equal(c(min(test.lvm),mean(test.lvm),max(test.lvm)),
                 c(-0.08912488, 0.00188713, 0.18430283),
                 tol = 1e-8) ## compare with previous version
    ## summary2(e.lvm)
    
    ## ERROR: the model is overparametrized
    ## test.lme <- sCorrect(e.lme, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = FALSE)$dVcov.param
    ## GS.lme <- sCorrect(e.lme, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = TRUE)$dVcov.param
    ## expect_equal(test.lme, GS.lme)

    test.gls <- sCorrect(e.gls, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = FALSE)$dVcov.param
    GS.gls <- sCorrect(e.gls, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = TRUE)$dVcov.param
    expect_equal(test.gls, GS.gls)
})


## * LVM: factor model
## ** model fit
m <- lvm(c(Y1~eta1,Y2~eta1,Y3~eta1+X1))
regression(m) <- eta1~X1+X2

e.lvm <- estimate(m,d)

## ** check dVcov
test_that("factor model: Satterthwaite (dVcov)", {
    test.lvm <- sCorrect(e.lvm, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = FALSE)$dVcov.param
    GS.lvm <- sCorrect(e.lvm, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = TRUE)$dVcov.param
    expect_equal(test.lvm, GS.lvm)
    expect_equal(c(min(test.lvm),mean(test.lvm),max(test.lvm)),
                 c(-0.297105651, 0.001184003, 0.360920233),
                 tol = 1e-8) ## compare with previous version
})



## * LVM: factor model with constrains
## ** model fit
e.lvm <- estimate(lvm(Y1~1*eta+1*X2,Y2~1*eta,Y3~1*eta),
                  data = d)

e.lvm2 <- estimate(lvm(Y1~1*eta+X2,
                       Y2~lambda*eta+X2,
                       Y3~lambda*eta,
                       eta ~ beta*X2+beta*X1),
                   data = d)

## ** check dVcov
test_that("factor model: Satterthwaite", {
    test.lvm <- sCorrect(e.lvm, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = FALSE)$dVcov.param
    GS.lvm <- sCorrect(e.lvm, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = TRUE)$dVcov.param
    expect_equal(test.lvm, GS.lvm)
    expect_equal(c(min(test.lvm),mean(test.lvm),max(test.lvm)),
                 c(-0.035030251, 0.004314892, 0.289075943),
                 tol = 1e-8) ## compare with previous version    
})

## * LVM: 2 factor model
## ** model fit
m <- lvm(c(Y1~eta1,Y2~eta1,Y3~eta1+X1,
           Z1~eta2,Z2~eta2,Z3~eta2+X3))
regression(m) <- eta1~X1+X2
latent(m) <- ~eta1+eta2

e.lvm <- estimate(m,d)

## ** check dVcov
test_that("2 factor model: Satterthwaite", {
    test.lvm <- sCorrect(e.lvm, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = FALSE)$dVcov.param
    GS.lvm <- sCorrect(e.lvm, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = TRUE)$dVcov.param
    expect_equal(test.lvm, GS.lvm)
    expect_equal(c(min(test.lvm),mean(test.lvm),max(test.lvm)),
                 c(-1.407457972, 0.000378982, 1.299890022),
                 tol = 1e-8) ## compare with previous version   
})

## * LVM: 2 factor model with constrains
## ** model fit
m <- lvm(Y1~1*eta1+X2,Y2~lambda*eta1+X2,Y3~lambda*eta1,eta1 ~ beta*X2+beta*X1,
         Z1~0+eta2,Z2~lambda*eta2,Z3~eta2)
e.lvm <- estimate(m, d)
e2.lvm <- e.lvm

## ** check dVcov
test_that("2 factor model with constrains: Satterthwaite", {
    test.lvm <- sCorrect(e.lvm, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = FALSE)$dVcov.param
    GS.lvm <- sCorrect(e.lvm, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = TRUE)$dVcov.param
    expect_equal(test.lvm, GS.lvm)
    expect_equal(c(min(test.lvm),mean(test.lvm),max(test.lvm)),
                 c(-0.9719462803, 0.0005765745, 1.0173093948),
                 tol = 1e-8) ## compare with previous version   
})

## * LVM: 2 factor model (covariance)
## ** model fit
m <- lvm(c(Y1~eta1,Y2~eta1,Y3~eta1+X1,
           Z1~eta2,Z2~eta2,Z3~eta2+X3))
covariance(m) <- eta1 ~ eta2
latent(m) <- ~eta1+eta2

e.lvm <- estimate(m,d)

## ** check dVcov
test_that("2 factor model with covariance: Satterthwaite", {
    test.lvm <- sCorrect(e.lvm, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = FALSE)$dVcov.param
    GS.lvm <- sCorrect(e.lvm, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = TRUE)$dVcov.param
    expect_equal(test.lvm, GS.lvm)
    expect_equal(c(min(test.lvm),mean(test.lvm),max(test.lvm)),
                 c(-1.0091216732, 0.0004489561, 1.0301898081),
                 tol = 1e-8) ## compare with previous version   
})

## * LVM: 2 factor model (correlation LV)
## ** model fit
m <- lvm(c(Y1~eta1,Y2~eta1,Y3~eta1+X1,
           Z1~eta2,Z2~eta2,Z3~eta2+X3))
regression(m) <- eta2 ~ X1
regression(m) <- eta1 ~ eta2+X2+X3

e.lvm <- estimate(m,d)

## ** check dVcov
test_that("2 factor model with correlation: Satterthwaite (dVcov)", {
    test.lvm <- sCorrect(e.lvm, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = FALSE)$dVcov.param
    GS.lvm <- sCorrect(e.lvm, adjust.Omega = FALSE, adjust.n = FALSE, numeric.derivative = TRUE)$dVcov.param
    expect_equal(test.lvm, GS.lvm)
    expect_equal(c(min(test.lvm),mean(test.lvm),max(test.lvm)),
                 c(-0.7338483344, 0.0002132907, 0.8107582027),
                 tol = 1e-8) ## compare with previous version
})
