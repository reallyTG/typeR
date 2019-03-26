### test1-sCorrect-smallSampleCorrection.R --- 
##----------------------------------------------------------------------
## Author: Brice Ozenne
## Created: mar  7 2018 (12:08) 
## Version: 
## Last-Updated: apr 26 2018 (13:28) 
##           By: Brice Ozenne
##     Update #: 56
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
library(clubSandwich)
library(nlme)
calcFactor <- function(object){
    return((object$dims$N - object$dims$p)/(object$dims$N - object$dims$p * (object$method == "REML")))
}

context("sCorrect (Satterthwaite + small sample correction)")

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
dLred$variable.factor <- as.factor(dLred$variable)

## * linear regression [lm,gls,lvm]
## ** model fit and sCorrect
e.lm <- lm(Y1~X1+X2, data = d)

## ** iid2 matches clubSandwich
test_that("iid2.lm/iid2.lvm matches clubSandwich", {
    V.GS <- clubSandwich::vcovCR(e.lm, type = "CR2", cluster = d$Id)
    
    eHC2.iid2.lm <- iid2(e.lm, bias.correct = TRUE)
    V.lm <- crossprod(eHC2.iid2.lm)

    ## no more equal to clubSandwich since version 1.2.1 
    ## > lavaSearch2 uses the average bias to correct the residuals instead of the individual bias
    
    ## expect_equal(as.matrix(V.GS),
    ##              V.lm[rownames(V.GS),colnames(V.GS)],
    ##              tol = 1e-7)
})


## * multiple linear regression with constrains [lvm, gls]
## ** model fit and sCorrect
e.gls <- gls(value ~ X1 + X2,
             data = dLred,
             weight = varIdent(form = ~1|variable),
             method = "ML")
e.lvm <- estimate(lvm(Y1[mu:sigma1]~ beta1*X1 + beta2*X2,
                      Y2[mu:sigma2]~ beta1*X1 + beta2*X2,
                      Y3[mu:sigma3]~ beta1*X1 + beta2*X2),
                  data = d)

factor <- calcFactor(e.gls)
index.coef <- 1:3

test_that("gls equivalent to lvm", {
    expect_equal(as.double(logLik(e.lvm)), as.double(logLik(e.gls)))
})
 
## ** HC0/HC1
iid2HC0.gls <- iid2(e.gls, bias.correct = FALSE, cluster = "Id")
iid2HC0.lvm <- iid2(e.lvm, bias.correct = FALSE)

test_that("iid2.gls/iid2.lvm matches clubSandwich (HC0-HC1)", {
    expect_equal(unname(iid2HC0.gls[,index.coef]),
                 unname(iid2HC0.lvm[,index.coef]),
                 tol = 1e-5)
    
    VHC0.gls <- crossprod(iid2HC0.gls)[index.coef,index.coef]
    GS <- clubSandwich::vcovCR(e.gls, type = "CR0", cluster = dLred$Id) * factor^2
    expect_equal(as.double(GS),as.double(VHC0.gls), tolerance = 1e-10)
    
    GS <- clubSandwich::vcovCR(e.gls, type = "CR1", cluster = dLred$Id) * factor^2
    VHC1.gls <- VHC0.gls*n/(n-1)
    expect_equal(as.double(GS),as.double(VHC1.gls), tolerance = 1e-10)
})

## ** HC2
iid2HC2.gls <- iid2(e.gls, bias.correct = TRUE, n.iter = 1, cluster = "Id")
iid2HC2.lvm <- iid2(e.lvm, bias.correct = TRUE, n.iter = 1)

test_that("iid2.lvm matches clubSandwich (HC2)", {
    expect_equal(unname(iid2HC2.gls[,index.coef]),
                 unname(iid2HC2.lvm[,index.coef]),
                 tol = 1e-5)

    VHC2.gls <- crossprod(iid2HC2.gls)[index.coef,index.coef]
    GS <- clubSandwich::vcovCR(e.gls, type = "CR2", cluster = dLred$Id) * factor^2

    ## no more equal to clubSandwich since version 1.2.1 
    ## > lavaSearch2 uses the average bias to correct the residuals instead of the individual bias
    ## expect_equal(as.double(GS),as.double(VHC2.gls), tolerance = 1e-5)
})

## * mixed model: CS [lvm,gls,lme]
## ** model fit and sCorrect
m <- lvm(c(Y1[0:sigma]~1*eta,
           Y2[0:sigma]~1*eta,
           Y3[0:sigma]~1*eta,
           eta~X1+X2))
latent(m) <- ~eta
e.lvm <- estimate(m, d)

e.lme <- nlme::lme(value ~ X1 + X2,
                   random =~1| Id,
                   data = dLred, method = "ML")

e.gls <- nlme::gls(value ~ X1 + X2,
                   correlation = corCompSymm(form = ~1| Id),
                   data = dLred, method = "ML")
index.coef <- 1:length(coef(e.gls))

test_that("lme/gls equivalent to lvm", {
    expect_equal(as.double(logLik(e.lvm)), as.double(logLik(e.lme)))
    expect_equal(as.double(logLik(e.gls)), as.double(logLik(e.lme)))
})

factor <- calcFactor(e.gls)
 
## ** HC0/HC1
iid2HC0.gls <- iid2(e.gls, bias.correct = FALSE)
iid2HC0.lme <- iid2(e.lme, bias.correct = FALSE)
iid2HC0.lvm <- iid2(e.lvm, bias.correct = FALSE)

test_that("iid2.gls/iid2.lme/iid2.lvm matches clubSandwich (HC0-HC1)", {
    expect_equal(unname(iid2HC0.gls[,index.coef]),
                 unname(iid2HC0.lvm[,index.coef]),
                 tol = 1e-5)

    expect_equal(unname(iid2HC0.gls[,index.coef]),
                 unname(iid2HC0.lme[,index.coef]),
                 tol = 1e-5)
    
    VHC0.gls <- crossprod(iid2HC0.gls)[index.coef,index.coef]
    GS <- clubSandwich::vcovCR(e.gls, type = "CR0", cluster = dLred$Id) * factor^2
    expect_equal(as.double(GS),as.double(VHC0.gls), tolerance = 1e-10)

    GS <- clubSandwich::vcovCR(e.gls, type = "CR1", cluster = dLred$Id) * factor^2
    VHC1.gls <- VHC0.gls*n/(n-1)
    expect_equal(as.double(GS),as.double(VHC1.gls), tolerance = 1e-10)
})

## ** HC2
iid2HC2.gls <- iid2(e.gls, bias.correct = TRUE, n.iter = 1)
iid2HC2.lme <- iid2(e.lme, bias.correct = TRUE, n.iter = 1)
iid2HC2.lvm <- iid2(e.lvm, bias.correct = TRUE, n.iter = 1)

test_that("iid2.gls/iid2.lme/iid2.lvm matches clubSandwich (HC2)", {
    expect_equal(unname(iid2HC2.gls[,index.coef]),
                 unname(iid2HC2.lvm[,index.coef]),
                 tol = 1e-5)

    expect_equal(unname(iid2HC2.gls[,index.coef]),
                 unname(iid2HC2.lme[,index.coef]),
                 tol = 1e-5)

    VHC2.gls <- crossprod(iid2HC2.gls)[index.coef,index.coef]
    GS <- clubSandwich::vcovCR(e.gls, type = "CR2", cluster = dLred$Id) * factor^2
    ## no more equal to clubSandwich since version 1.2.1 
    ## > lavaSearch2 uses the average bias to correct the residuals instead of the individual bias
    ## expect_equal(as.double(GS),as.double(VHC2.gls), tolerance = 1e-10)
})

## * mixed model: CS with different variances [lvm,gls]
## ** model fit and sCorrect
m <- lvm(c(Y1[0:sigma1]~1*eta,
           Y2[0:sigma2]~1*eta,
           Y3[0:sigma3]~1*eta,
           eta~X1+X2))
latent(m) <- ~eta
e.lvm <- estimate(m, d)

e.lme <- nlme::lme(value ~ X1 + X2,
                   random =~1| Id,
                   weights = varIdent(form =~ 1|variable),
                   data = dLred, method = "ML")

e.gls <- nlme::gls(value ~ X1 + X2,
                   correlation = corCompSymm(form = ~1| Id),
                   weights = varIdent(form =~ 1|variable),
                   data = dLred, method = "ML")
index.coef <- 1:length(coef(e.gls))

test_that("lme equivalent to lvm", {
    expect_equal(as.double(logLik(e.lvm)), as.double(logLik(e.lme)))
    ## gls does not give the same likelihood
    ## expect_equal(as.double(logLik(e.gls)), as.double(logLik(e.lme)))
})

## ** HC0/HC1
iid2HC0.gls <- iid2(e.gls, bias.correct = FALSE)
iid2HC0.lme <- iid2(e.lme, bias.correct = FALSE)
iid2HC0.lvm <- iid2(e.lvm, bias.correct = FALSE)

test_that("iid2.lme/iid2.lvm matches clubSandwich (HC0-HC1)", {
    expect_equal(unname(iid2HC0.lme[,index.coef]),
                 unname(iid2HC0.lvm[,index.coef]),
                 tol = 1e-5)

    VHC0.lme <- crossprod(iid2HC0.lme)[index.coef,index.coef]
    GS <- clubSandwich::vcovCR(e.lme, type = "CR0", cluster = dLred$Id)
    expect_equal(as.double(GS),as.double(VHC0.lme), tolerance = 1e-10)

    GS <- clubSandwich::vcovCR(e.lme, type = "CR1", cluster = dLred$Id)
    VHC1.lme <- VHC0.lme*n/(n-1)
    expect_equal(as.double(GS),as.double(VHC1.lme), tolerance = 1e-10)
})

## ** HC2
iid2HC2.gls <- iid2(e.gls, bias.correct = TRUE, n.iter = 1)
iid2HC2.lme <- iid2(e.lme, bias.correct = TRUE, n.iter = 1)
iid2HC2.lvm <- iid2(e.lvm, bias.correct = TRUE, n.iter = 1)

test_that("iid2.lme/iid2.lvm matches clubSandwich (HC2)", {
    expect_equal(unname(iid2HC2.lme[,index.coef]),
                 unname(iid2HC2.lvm[,index.coef]),
                 tol = 1e-5)

    VHC2.lme <- crossprod(iid2HC2.lme)[index.coef,index.coef]
    GS <- clubSandwich::vcovCR(e.lme, type = "CR2", cluster = dLred$Id)
    ## no more equal to clubSandwich since version 1.2.1 
    ## > lavaSearch2 uses the average bias to correct the residuals instead of the individual bias
    ## expect_equal(as.double(GS),as.double(VHC2.lme), tolerance = 1e-5)
})


## * mixed model: Unstructured
## ** model fit and sCorrect
m <- lvm(c(Y1~0+1*eta,
           Y2~0+1*eta,
           Y3~0+1*eta,
           eta~X1+X2))
covariance(m) <- Y1~Y2
covariance(m) <- Y1~Y3
e.lvm <- estimate(m, d)

e.gls <- nlme::gls(value ~ X1 + X2,
                   correlation = corSymm(form =~ 1| Id),
                   weight = varIdent(form =~ 1|variable),
                   data = dLred, method = "ML")

e.lme <- nlme::lme(value ~ X1 + X2,
                   random =~ 1|Id,
                   correlation = corSymm(),
                   weight = varIdent(form =~ 1|variable),
                   data = dLred, method = "ML")

index.coef <- 1:length(coef(e.gls))

test_that("lme/gls equivalent to lvm", {
    expect_equal(as.double(logLik(e.lvm)), as.double(logLik(e.lme)))
    expect_equal(as.double(logLik(e.gls)), as.double(logLik(e.lme)))
})

## ** HC0/HC1
iid2HC0.gls <- iid2(e.gls, bias.correct = FALSE)
## iid2HC0.lme <- iid2(e.lme, bias.correct = FALSE)
## does not work because the model is overparametrized
iid2HC0.lvm <- iid2(e.lvm, bias.correct = FALSE)

test_that("iid2.gls/iid2.lme/iid2.lvm matches clubSandwich (HC0-HC1)", {
    expect_equal(unname(iid2HC0.gls[,index.coef]),
                 unname(iid2HC0.lvm[,index.coef]),
                 tol = 1e-5)

    VHC0.lvm <- crossprod(iid2HC0.lvm)[index.coef,index.coef]
    GS <- clubSandwich::vcovCR(e.lme, type = "CR0", cluster = dLred$Id)
    expect_equal(as.double(GS),as.double(VHC0.lvm), tolerance = 1e-5)

    GS <- clubSandwich::vcovCR(e.lme, type = "CR1", cluster = dLred$Id)
    VHC1.lvm <- VHC0.lvm*n/(n-1)
    expect_equal(as.double(GS),as.double(VHC1.lvm), tolerance = 1e-5)
})

## ** HC2
iid2HC2.gls <- iid2(e.gls, bias.correct = TRUE, n.iter = 1)
expect_error(iid2HC2.lme <- iid2(e.lme, bias.correct = TRUE, n.iter = 1))
## does not work because the model is overparametrized
iid2HC2.lvm <- iid2(e.lvm, bias.correct = TRUE, n.iter = 1)

test_that("iid2.gls/iid2.lme/iid2.lvm matches clubSandwich (HC2)", {
    expect_equal(unname(iid2HC2.gls[,index.coef]),
                 unname(iid2HC2.lvm[,index.coef]),
                 tol = 1e-5)

    VHC2.lvm <- crossprod(iid2HC2.lvm)[index.coef,index.coef]
    GS <- clubSandwich::vcovCR(e.lme, type = "CR2", cluster = dLred$Id)
    ## no more equal to clubSandwich since version 1.2.1 
    ## > lavaSearch2 uses the average bias to correct the residuals instead of the individual bias
    ## expect_equal(as.double(GS),as.double(VHC2.lvm), tolerance = 1e-5)
})


##----------------------------------------------------------------------
### test1-sCorrect-smallSampleCorrection.R ends here
