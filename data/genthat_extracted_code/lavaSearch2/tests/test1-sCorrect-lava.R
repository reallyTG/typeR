### test1-sCorrect-lava.R --- 
##----------------------------------------------------------------------
## Author: Brice Ozenne
## Created: mar  6 2018 (10:40) 
## Version: 
## Last-Updated: apr  4 2018 (14:20) 
##           By: Brice Ozenne
##     Update #: 137
##----------------------------------------------------------------------
## 
### Commentary: 
## 
### Change Log:
##----------------------------------------------------------------------
## 
### Code:

## source("c:/Users/hpl802/Documents/GitHub/lavaSearch2/tests/testthat/test1-iid2-lava.R")

## * header
rm(list = ls())
if(FALSE){ ## already called in test-all.R
    library(testthat)
    library(lavaSearch2)
}

lava.options(symbols = c("~","~~"))
.coef2 <- lavaSearch2:::.coef2
library(nlme)
context("sCorrect (replicate lava results)")

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
## ** model fit and sCorrect
e.lvm <- estimate(lvm(Y1~X1+X2+Gender), data = d)
e.lm <- lm(Y1~X1+X2+Gender, data = d)
e.gls <- gls(Y1~X1+X2+Gender, data = d, method = "ML")

e2.lvm <- e.lvm
e2.gls <- e.gls
e2.lm <- e.lm

sCorrect(e2.lvm) <- FALSE
sCorrect(e2.gls, cluster = 1:n) <- FALSE
sCorrect(e2.lm) <- FALSE

## ** check score, iid, residuals, vcov, compare2 at ML
test_that("linear regression (at ML) internal consistency",{
    expect_equivalent(e2.lvm$sCorrect$Omega,e2.lm$sCorrect$Omega)
    expect_equivalent(e2.gls$sCorrect$Omega,e2.lm$sCorrect$Omega)

    expect_equivalent(e2.lvm$sCorrect$vcov.param,e2.lm$sCorrect$vcov.param)
    expect_equivalent(e2.gls$sCorrect$vcov.param,e2.lm$sCorrect$vcov.param)

    expect_equivalent(e2.lvm$sCorrect$leverage,e2.lm$sCorrect$leverage)
    expect_equivalent(e2.gls$sCorrect$leverage,e2.lm$sCorrect$leverage)

    expect_equivalent(e2.lvm$sCorrect$score,e2.lm$sCorrect$score)
    expect_equivalent(e2.gls$sCorrect$score,e2.lm$sCorrect$score)

    expect_equivalent(e2.lvm$sCorrect$epsilon,e2.lm$sCorrect$epsilon)
    expect_equivalent(e2.gls$sCorrect$epsilon,e2.lm$sCorrect$epsilon)

    expect_equivalent(e2.lvm$sCorrect$dVcov.param,e2.lm$sCorrect$dVcov.param)
    expect_equivalent(e2.gls$sCorrect$dVcov.param,e2.lm$sCorrect$dVcov.param)    

    expect_equivalent(iid2(e2.gls), iid2(e2.lvm))    
    expect_equivalent(iid2(e2.lm), iid2(e2.lvm))    
})

test_that("linear regression (at ML) compare to lava",{

    expect_equivalent(e2.lvm$sCorrect$vcov.param, vcov(e.lvm))
    expect_true(all(e2.lvm$sCorrect$leverage==0))
    expect_true(e2.lvm$sCorrect$n.corrected==e.lvm$data$n)
    expect_equivalent(e2.lvm$sCorrect$residuals, residuals(e.lvm))
    expect_equal(e2.lvm$sCorrect$param, coef(e.lvm))
    expect_equal(e2.lvm$sCorrect$score, score(e.lvm, indiv = TRUE))
    expect_equal(score2(e.lvm, bias.correct = FALSE), score(e.lvm, indiv = TRUE))

    GS <- iid(e.lm)
    expect_equivalent(iid2(e2.lvm)[,1:length(colnames(GS))], GS)
    expect_equal(e2.lvm$sCorrect$residuals, residuals2(e2.lvm))

    ## NOTE: iid in lava uses numerical derivative to compute the information matrix
    ## this is why there is not a perfect matching between iid2.lvm and iid.lvm
    
    ## expect_equal(as.double(iid2(e2.lvm)), as.double(iid(e.lvm)))
    
    ## Error: as.double(iid2(e2.lvm)) not equal to as.double(iid(e.lvm)).
    ## 245/250 mismatches (average diff: 1.46e-06)
    ## [1] -0.01755 - -0.01756 ==  6.95e-07
    ## [2] -0.02036 - -0.02037 ==  6.63e-07
    ## [3]  0.04413 -  0.04413 ==  4.34e-07
    ## [4]  0.00615 -  0.00615 == -9.30e-07
    ## [5]  0.00236 -  0.00236 ==  2.20e-07
    ## [6]  0.01338 -  0.01338 ==  7.35e-07
    ## [7] -0.00482 - -0.00482 == -4.08e-08
    ## [8]  0.04877 -  0.04877 ==  3.21e-07
    ## [9] -0.00811 - -0.00811 == -1.35e-06 

    expect_true(all(leverage2(e2.lvm) == 0))

    C1 <- compare2(e2.lvm, par = c("Y1~X1","Y1~X2"))
    C2 <- lava::compare(e.lvm, par = c("Y1~X1","Y1~X2"))
    expect_equal(unname(C1$statistic),
                 unname(C2$statistic/NROW(C1$estimate))
                 )

})

## ** check score not at ML
S1 <- score2(e2.lvm, param = coef(e2.lvm)+1)
S2 <- score2(e.lvm, param = coef(e.lvm)+1, bias.correct = FALSE)

S3 <- score2(e2.lm, param = .coef2(e2.gls)+1) ## not .coef2(e2.lm) because different estimate of the variance
S4 <- score2(e.lm, param = .coef2(e.gls)+1, bias.correct = FALSE)

S5 <- score2(e2.gls, param = .coef2(e2.gls)+1)
S6 <- score2(e.gls, param = .coef2(e.gls)+1, cluster = 1:n, bias.correct = FALSE)

GS <- score(e.lvm, p = coef(e.lvm)+1, indiv = TRUE)

test_that("linear regression (at ML + 1) compare to lava",{
    expect_equal(S1, GS)
    expect_equal(S2, GS)
    
    expect_equal(as.double(S3), as.double(GS))
    expect_equal(as.double(S4), as.double(GS))
    expect_equal(as.double(S5), as.double(GS))
    expect_equal(as.double(S6), as.double(GS))
})

p <- length(coef(e.lvm))
S1 <- score2(e2.lvm, param = coef(e2.lvm)+1:p)
S2 <- score2(e.lvm, param = coef(e.lvm)+1:p, bias.correct = FALSE)

S3 <- score2(e2.lm, param = .coef2(e2.gls)+1:p) ## not .coef2(e2.lm) because different estimate of the variance
S4 <- score2(e.lm, param = .coef2(e.gls)+1:p, bias.correct = FALSE)

S5 <- score2(e2.gls, param = .coef2(e2.gls)+1:p)
S6 <- score2(e.gls, param = .coef2(e.gls)+1:p, cluster = 1:n, bias.correct = FALSE)
GS <- score(e.lvm, p = coef(e.lvm)+1:p, indiv = TRUE)

test_that("linear regression (at ML + 1:p) compare to lava",{
    
    expect_equal(S1, GS)
    expect_equal(S2, GS)
    
    expect_equal(as.double(S3), as.double(GS))
    expect_equal(as.double(S4), as.double(GS))
    expect_equal(as.double(S5), as.double(GS))
    expect_equal(as.double(S6), as.double(GS))
    
})


## * linear regression with constrains [lvm]
## ** model fit and sCorrect
e.lvm <- estimate(lvm(Y1[0:2]~X1+1*X2), data = d)

e2.lvm <- e.lvm
sCorrect(e2.lvm) <- FALSE

e.lvm2 <- estimate(lvm(Y1~beta*X1+beta*X2), d)

e2.lvm2 <- e.lvm2
sCorrect(e2.lvm2) <- FALSE

## ** check score, iid, residuals, vcov, compare2 at ML
test_that("linear regression: constrains",{
    expect_equivalent(e2.lvm$sCorrect$vcov.param, vcov(e.lvm))
    expect_true(all(e2.lvm$sCorrect$leverage==0))
    expect_true(e2.lvm$sCorrect$n.corrected==e.lvm$data$n)
    expect_equivalent(e2.lvm$sCorrect$residuals, residuals(e.lvm))
    expect_equal(e2.lvm$sCorrect$param, coef(e.lvm))
    expect_equal(e2.lvm$sCorrect$score, score(e.lvm, indiv = TRUE))
    expect_equal(score2(e.lvm, bias.correct = FALSE), score(e.lvm, indiv = TRUE))
    
    expect_equal(score2(e.lvm, bias.correct = FALSE),
                 score(e.lvm, indiv = TRUE))
})

## * multiple linear regression [lvm,gls]
## ** model fit and sCorrect
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


e2.lvm <- e.lvm
sCorrect(e2.lvm) <- FALSE

e2.lvm2 <- e.lvm2
sCorrect(e2.lvm2) <- FALSE

e2.gls <- e.gls
sCorrect(e2.gls, cluster = "Id") <- FALSE

## ** check score, iid, residuals, vcov, compare2 at ML

test_that("multiple linear regression (at ML) internal consistency",{
    param <- attr(e2.gls$sCorrect$param,"mean.coef")

    expect_equal(unname(e2.lvm2$sCorrect$Omega),
                 unname(e2.gls$sCorrect$Omega),
                 tolerance = 1e-5)
    expect_equal(unname(e2.lvm2$sCorrect$residuals),
                 unname(e2.gls$sCorrect$residuals),
                 tolerance = 1e-5)
    expect_equal(unname(e2.lvm2$sCorrect$score[,c("Y1","Y1~X1","Y1~X2")]),
                 unname(e2.gls$sCorrect$score[,c("(Intercept)","X1","X2")]),
                 tolerance = 1e-5)
})

e2.lvm2$sCorrect$residuals[1:5,]
e2.gls$sCorrect$residuals[1:5,]

test_that("multiple linear regression (at ML) compare to lava",{

    expect_equivalent(e2.lvm$sCorrect$vcov.param, vcov(e.lvm))
    expect_true(all(e2.lvm$sCorrect$leverage==0))
    expect_true(all(e2.lvm$sCorrect$n.corrected==e.lvm$data$n))
    expect_equal(e2.lvm$sCorrect$residuals, residuals(e.lvm))
    expect_equal(e2.lvm$sCorrect$param, coef(e.lvm))
    expect_equal(e2.lvm$sCorrect$score, score(e.lvm, indiv = TRUE))

    GS <- lapply(ls.lm,iid)
    test <- iid2(e2.lvm)
    expect_equivalent(test[,grep("^Y1$|^Y1~X",colnames(test))], GS[[1]])
    expect_equivalent(test[,grep("^Y2$|^Y2~X",colnames(test))], GS[[2]])
    expect_equivalent(test[,grep("^Y3$|^Y3~X",colnames(test))], GS[[3]])
    expect_equal(e2.lvm$sCorrect$residuals, residuals2(e2.lvm))
    expect_true(all(leverage2(e2.lvm) == 0))

    C1 <- compare2(e2.lvm, par = c("Y1~X1","Y2~X2","Y3~X1"))
    C2 <- lava::compare(e.lvm, par = c("Y1~X1","Y2~X2","Y3~X1"))
    expect_equal(unname(C1$statistic),
                 unname(C2$statistic/NROW(C1$estimate))
                 )
})

## ** check score not at ML
test_that("multiple linear regression (at ML + 1) compare to lava",{
    S1 <- score2(e2.lvm, param = coef(e2.lvm)+1)
    S2 <- score2(e.lvm, param = coef(e.lvm)+1, bias.correct = FALSE)

    GS <- score(e.lvm, p = coef(e.lvm)+1, indiv = TRUE)

    expect_equal(S1, GS)
    expect_equal(S2, GS)
})

test_that("multiple linear regression (at ML + 1:p) compare to lava",{
    p <- length(coef(e.lvm))
    S1 <- score2(e2.lvm, param = coef(e2.lvm)+1:p)
    S2 <- score2(e.lvm, param = coef(e.lvm)+1:p, bias.correct = FALSE)

    GS <- score(e.lvm, p = coef(e.lvm)+1:p, indiv = TRUE)
    
    expect_equal(S1, GS)
    expect_equal(S2, GS)
})

## * multiple linear regression with constrains [lvm]
## ** model fit and sCorrect
e.lvm <- estimate(lvm(Y1~X1+1*X2,Y2~2*X3+2*X1,Y3~X2), data = d)
e2.lvm <- e.lvm
sCorrect(e2.lvm) <- FALSE    

## ** check score, residuals, vcov
test_that("multiple linear regressions: constrains",{

    expect_equivalent(e2.lvm$sCorrect$vcov.param, vcov(e.lvm))
    expect_true(all(e2.lvm$sCorrect$leverage==0))
    expect_true(all(e2.lvm$sCorrect$n.corrected==e.lvm$data$n))
    expect_equal(e2.lvm$sCorrect$residuals, residuals(e.lvm))
    expect_equal(e2.lvm$sCorrect$param, coef(e.lvm))
    expect_equal(e2.lvm$sCorrect$score, score(e.lvm, indiv = TRUE))

    expect_equal(e2.lvm$sCorrect$residuals, residuals2(e2.lvm))
    expect_true(all(leverage2(e2.lvm) == 0))

    C1 <- compare2(e2.lvm, par = c("Y1~X1"))
    C2 <- lava::compare(e.lvm, par = c("Y1~X1"))
    expect_equal(unname(C1$statistic),
                 unname(C2$statistic/NROW(C1$estimate))
                 )
})

## * multiple linear regression with covariance links [lvm]
## ** model fit and sCorrect
e.lvm <- estimate(lvm(Y1~X1+X2,Y2~X3+X1,Y3~X2,Y1~~Y2),d)
e2.lvm <- e.lvm
sCorrect(e2.lvm) <- FALSE

## ** check score, residuals, vcov at ML
test_that("multiple linear regression, covariance link (at ML)",{
    expect_equivalent(e2.lvm$sCorrect$vcov.param, vcov(e.lvm))
    expect_true(all(e2.lvm$sCorrect$leverage==0))
    expect_true(all(e2.lvm$sCorrect$n.corrected==e.lvm$data$n))
    expect_equal(e2.lvm$sCorrect$residuals, residuals(e.lvm))
    expect_equal(e2.lvm$sCorrect$param, coef(e.lvm))
    expect_equal(e2.lvm$sCorrect$score, score(e.lvm, indiv = TRUE))
    expect_equal(score2(e.lvm, bias.correct = FALSE),
                 score(e.lvm, indiv=TRUE))
    
    expect_equal(e2.lvm$sCorrect$residuals, residuals2(e2.lvm))
    expect_true(all(leverage2(e2.lvm) == 0))
})

## ** check score not at ML
test_that("multiple linear regression, covariance link (not at ML: +1)",{
    expect_equal(score2(e.lvm, p = coef(e.lvm)+1, bias.correct = FALSE),
                 score(e.lvm, p = coef(e.lvm)+1, indiv=TRUE))
})

test_that("multiple linear regression, covariance link (not at ML: +1:p)",{
    newcoef <- coef(e.lvm)+0.1*(1:length(coef(e.lvm)))
    expect_equal(score2(e.lvm, p = newcoef, bias.correct = FALSE),
                 score(e.lvm, p = newcoef, indiv = TRUE))
})

## * mixed model: Compound symmetry [lvm,gls,lme]
## ** model fit and sCorrect
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

e2.lvm <- e.lvm
sCorrect(e2.lvm) <- FALSE

e2.lme <- e.lme
sCorrect(e2.lme) <- FALSE

e2.gls <- e.gls
sCorrect(e2.gls) <- FALSE


## ** check score, residuals, vcov at ML
test_that("compound symmetry (at ML) internal consistency",{
    param.nlme <- names(coef(e.gls))
    param.lava <- c("eta","Y2","Y3","eta~X1","eta~GenderFemale")
    
    expect_equal(unname(e2.lvm$sCorrect$Omega),unname(e2.lme$sCorrect$Omega), tol = 1e-5)
    expect_equal(unname(e2.lme$sCorrect$Omega),unname(e2.gls$sCorrect$Omega), tol = 1e-5)

    expect_equal(unname(e2.lvm$sCorrect$vcov.param[param.lava,param.lava]),
                 unname(e2.lme$sCorrect$vcov.param[param.nlme,param.nlme]), tol = 1e-5)
    expect_equal(unname(e2.gls$sCorrect$vcov.param[param.nlme,param.nlme]),
                 unname(e2.lme$sCorrect$vcov.param[param.nlme,param.nlme]), tol = 1e-5)
    
    expect_equal(unname(e2.lvm$sCorrect$score[,param.lava]),
                 unname(e2.lme$sCorrect$score[,param.nlme]), tol = 1e-5)
    expect_equal(unname(e2.gls$sCorrect$score[,param.nlme]),
                 unname(e2.lme$sCorrect$score[,param.nlme]), tol = 1e-5)

    expect_equivalent(e2.lvm$sCorrect$residuals,e2.lme$sCorrect$residuals)
    expect_equivalent(e2.gls$sCorrect$residuals,e2.lme$sCorrect$residuals)

    expect_equivalent(e2.lvm$sCorrect$dVcov.param[param.lava,param.lava,"Y1~~Y1"],
                      e2.lme$sCorrect$dVcov.param[param.nlme,param.nlme,"sigma2"])

    expect_equivalent(iid2(e2.gls)[,param.nlme], iid2(e2.lme)[,param.nlme])    
    expect_equivalent(iid2(e2.lme)[,param.nlme], iid2(e2.lvm)[,param.lava])    
})

test_that("compound symmetry (at ML) compare to lava",{
    expect_equivalent(e2.lvm$sCorrect$vcov.param, vcov(e.lvm))
    expect_true(all(e2.lvm$sCorrect$leverage==0))
    expect_true(all(e2.lvm$sCorrect$n.corrected==e.lvm$data$n))
    expect_equal(e2.lvm$sCorrect$residuals, residuals(e.lvm))
    expect_equal(e2.lvm$sCorrect$param, coef(e.lvm))
    expect_equal(e2.lvm$sCorrect$score, score(e.lvm, indiv = TRUE))
    expect_equal(score2(e.lvm, bias.correct = FALSE),
                 score(e.lvm, indiv = TRUE))
    
    expect_equal(e2.lvm$sCorrect$residuals, residuals2(e2.lvm))
    expect_true(all(leverage2(e2.lvm) == 0))
})


## * mixed model: CS with different variances [lvm,lme]
## ** model fit and sCorrect
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

e2.lvm <- e.lvm
sCorrect(e2.lvm) <- FALSE

e2.lme <- e.lme
sCorrect(e2.lme) <- FALSE

e2.gls <- e.gls
sCorrect(e2.gls) <- FALSE

## ** check score, residuals, vcov at ML
test_that("compound symmetry with weights (at ML) internal consistency",{
    param.nlme <- names(coef(e.gls))
    param.lava <- c("eta","Y2","Y3","eta~X1","eta~GenderFemale")
    
    expect_equal(unname(e2.lvm$sCorrect$Omega),unname(e2.lme$sCorrect$Omega), tol = 1e-5)

    expect_equal(unname(e2.lvm$sCorrect$vcov.param[param.lava,param.lava]),
                 unname(e2.lme$sCorrect$vcov.param[param.nlme,param.nlme]), tol = 1e-5)
    
    expect_equal(unname(e2.lvm$sCorrect$score[,param.lava]),
                 unname(e2.lme$sCorrect$score[,param.nlme]), tol = 1e-5)

    expect_equal(unname(e2.lvm$sCorrect$residuals),
                 unname(e2.lme$sCorrect$residuals), tol = 1e-5)
})

test_that("compound symmetry with weights (at ML) compare to lava",{
    expect_equivalent(e2.lvm$sCorrect$vcov.param, vcov(e.lvm))
    expect_true(all(e2.lvm$sCorrect$leverage==0))
    expect_true(all(e2.lvm$sCorrect$n.corrected==e.lvm$data$n))
    expect_equal(e2.lvm$sCorrect$residuals, residuals(e.lvm))
    expect_equal(e2.lvm$sCorrect$param, coef(e.lvm))
    expect_equal(e2.lvm$sCorrect$score, score(e.lvm, indiv = TRUE))
    expect_equal(score2(e.lvm, bias.correct = FALSE),
                 score(e.lvm, indiv = TRUE))
    
    expect_equal(e2.lvm$sCorrect$residuals, residuals2(e2.lvm))
    expect_true(all(leverage2(e2.lvm) == 0))
})

## * mixed model: Unstructured [lvm,gls,lme]
## ** model fit and sCorrect
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

e2.lvm <- e.lvm
sCorrect(e2.lvm) <- FALSE

## e2.lme <- e.lme
## sCorrect(e2.lme) <- FALSE
## does not work because the model is overparametrized

e2.gls <- e.gls
sCorrect(e2.gls) <- FALSE

## ** check score, residuals, vcov at ML
test_that("Unstructured (at ML) internal consistency",{
    param.nlme <- names(coef(e.gls))
    param.lava <- c("eta","Y2","Y3","eta~X1","eta~GenderFemale")

    expect_equal(unname(e2.gls$sCorrect$Omega),unname(e2.lvm$sCorrect$Omega), tol = 1e-4)

    expect_equal(unname(e2.lvm$sCorrect$vcov.param[param.lava,param.lava]),
                 unname(e2.gls$sCorrect$vcov.param[param.nlme,param.nlme]), tol = 1e-4)
    
    expect_equal(unname(e2.lvm$sCorrect$score[,param.lava]),
                 unname(e2.gls$sCorrect$score[,param.nlme]), tol = 1e-4)
    
    expect_equal(unname(e2.lvm$sCorrect$residuals),
                 unname(e2.gls$sCorrect$residuals), tol = 1e-4)
})

test_that("Unstructured (at ML) compare to lava",{

    expect_equivalent(e2.lvm$sCorrect$vcov.param, vcov(e.lvm))
    expect_true(all(e2.lvm$sCorrect$leverage==0))
    expect_true(all(e2.lvm$sCorrect$n.corrected==e.lvm$data$n))
    expect_equivalent(e2.lvm$sCorrect$residuals, residuals(e.lvm))
    expect_equal(e2.lvm$sCorrect$param, coef(e.lvm))
    expect_equal(e2.lvm$sCorrect$score, score(e.lvm, indiv = TRUE))
    expect_equal(score2(e.lvm, bias.correct = FALSE), score(e.lvm, indiv = TRUE))
    
})

## * mixed model: Unstructured with weights [lvm,gls,lme]
## ** model fit and sCorrect
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

e2.lvm <- e.lvm
sCorrect(e2.lvm) <- FALSE

e2.lme <- e.lme
## sCorrect(e2.lme) <- FALSE
## does not work because the model is overparametrized

e2.gls <- e.gls
sCorrect(e2.gls) <- FALSE

## ** check score, residuals, vcov at ML
test_that("Unstructured with weights (at ML) internal consistency",{
    param.nlme <- names(coef(e.gls))
    param.lava <- c("eta","Y2","Y3","eta~X1","eta~GenderFemale")

    expect_equal(unname(e2.lvm$sCorrect$Omega),unname(e2.gls$sCorrect$Omega), tol = 1e-3)

    expect_equal(unname(e2.lvm$sCorrect$vcov.param[param.lava,param.lava]),
                 unname(e2.gls$sCorrect$vcov.param[param.nlme,param.nlme]), tol = 1e-3)
    
    expect_equal(unname(e2.lvm$sCorrect$score[,param.lava]),
                 unname(e2.gls$sCorrect$score[,param.nlme]), tol = 1e-3)

    expect_equal(unname(e2.lvm$sCorrect$residuals),
                 unname(e2.gls$sCorrect$residuals), tol = 1e-3)

})

test_that("Unstructured with weights (at ML) compare to lava",{

    expect_equivalent(e2.lvm$sCorrect$vcov.param, vcov(e.lvm))
    expect_true(all(e2.lvm$sCorrect$leverage==0))
    expect_true(all(e2.lvm$sCorrect$n.corrected==e.lvm$data$n))
    expect_equivalent(e2.lvm$sCorrect$residuals, residuals(e.lvm))
    expect_equal(e2.lvm$sCorrect$param, coef(e.lvm))
    expect_equal(e2.lvm$sCorrect$score, score(e.lvm, indiv = TRUE))
    expect_equal(score2(e.lvm, bias.correct = FALSE), score(e.lvm, indiv = TRUE))
    
})

## * LVM: factor model
## ** model fit and sCorrect
m <- lvm(c(Y1~eta1,Y2~eta1,Y3~eta1+X1))
regression(m) <- eta1~X1+X2

e.lvm <- estimate(m,d)
e2.lvm <- e.lvm
sCorrect(e2.lvm) <- FALSE

## ** check score, residuals, vcov at ML
test_that("factor model (at ML) compared to lava",{

    expect_equivalent(e2.lvm$sCorrect$vcov.param, vcov(e.lvm))
    expect_true(all(e2.lvm$sCorrect$leverage==0))
    expect_true(all(e2.lvm$sCorrect$n.corrected==e.lvm$data$n))
    expect_equivalent(e2.lvm$sCorrect$residuals, residuals(e.lvm))
    expect_equal(e2.lvm$sCorrect$param, coef(e.lvm))
    expect_equal(e2.lvm$sCorrect$score, score(e.lvm, indiv = TRUE))
    expect_equal(score2(e.lvm, bias.correct = FALSE), score(e.lvm, indiv = TRUE))

})

## ** check score not at ML
param <- coef(e.lvm)
test <- score2(e.lvm, p = param+1, bias.correct = FALSE)
GS <- score(e.lvm, p = param+1, indiv = TRUE)

test_that("factor model (not at ML: +1)",{
    expect_equal(test, GS)
})

test <- score2(e.lvm, p = param+0.1*(1:length(param)), bias.correct = FALSE)
GS <- score(e.lvm, p = param+0.1*(1:length(param)), indiv=TRUE)
test_that("factor model (not at ML: +1:p)",{
    expect_equal(test, GS)
})

## * LVM: factor model with constrains
## ** model fit and sCorrect
e.lvm <- estimate(lvm(Y1~1*eta+1*X2,Y2~1*eta,Y3~1*eta),
                  data = d)


e.lvm2 <- estimate(lvm(Y1~1*eta+X2,
                       Y2~lambda*eta+X2,
                       Y3~lambda*eta,
                       eta ~ beta*X2+beta*X1),
                   data = d)

e2.lvm <- e.lvm
sCorrect(e2.lvm) <- FALSE
e2.lvm2 <- e.lvm2
sCorrect(e2.lvm2) <- FALSE

## ** check score at ML
test_that("factor model: fixed coefficients",{
    expect_equal(score2(e2.lvm, bias.correct = FALSE),
                 score(e.lvm, indiv = TRUE))

    expect_equivalent(e2.lvm$sCorrect$vcov.param,
                      vcov(e.lvm))
})

test_that("factor model: constrains",{
    expect_equal(score2(e2.lvm2, bias.correct = FALSE),
                 score(e.lvm2, indiv = TRUE))

    expect_equivalent(e2.lvm2$sCorrect$vcov.param,
                      vcov(e.lvm2))
})


## * LVM: 2 factor model
## ** model fit and sCorrect
m <- lvm(c(Y1~eta1,Y2~eta1,Y3~eta1+X1,
           Z1~eta2,Z2~eta2,Z3~eta2+X3))
regression(m) <- eta1~X1+X2
latent(m) <- ~eta1+eta2

e.lvm <- estimate(m,d)
e2.lvm <- e.lvm
sCorrect(e2.lvm) <- FALSE

## ** check score, residuals, vcov at ML
test_that("2 factor model (at ML) compared to lava",{

    expect_equivalent(e2.lvm$sCorrect$vcov.param, vcov(e.lvm))
    expect_true(all(e2.lvm$sCorrect$leverage==0))
    expect_true(all(e2.lvm$sCorrect$n.corrected==e.lvm$data$n))
    expect_equivalent(e2.lvm$sCorrect$residuals, residuals(e.lvm))
    expect_equal(e2.lvm$sCorrect$param, coef(e.lvm))
    expect_equal(e2.lvm$sCorrect$score, score(e.lvm, indiv = TRUE))
    expect_equal(score2(e.lvm, bias.correct = FALSE), score(e.lvm, indiv = TRUE))

})


## ** check score not at ML
param <- coef(e.lvm)
test <- score2(e.lvm, p = param+1, bias.correct = FALSE)
GS <- score(e.lvm, p = param+1, indiv = TRUE)

test_that("2 factor model (not at ML: +1)",{
    expect_equal(test, GS)
})

test <- score2(e.lvm, p = param+0.1*(1:length(param)), bias.correct = FALSE)
GS <- score(e.lvm, p = param+0.1*(1:length(param)), indiv=TRUE)
test_that("2 factor model (not at ML: +1:p)",{
    expect_equal(test, GS)
})

## * LVM: 2 factor model with constrains
## ** model fit and sCorrect
m <- lvm(Y1~1*eta1+X2,Y2~lambda*eta1+X2,Y3~lambda*eta1,eta1 ~ beta*X2+beta*X1,
         Z1~0+eta2,Z2~lambda*eta2,Z3~eta2)
e.lvm <- estimate(m, d)
e2.lvm <- e.lvm
sCorrect(e2.lvm) <- FALSE

## ** check score at ML
test_that("2 factor model: constrains",{
    expect_equal(score2(e2.lvm, bias.correct = FALSE),
                 score(e.lvm, indiv = TRUE))

    expect_equivalent(e2.lvm$sCorrect$vcov.param,
                      vcov(e.lvm))
})

## * LVM: 2 factor model (covariance)
## ** model fit and sCorrect
m <- lvm(c(Y1~eta1,Y2~eta1,Y3~eta1+X1,
           Z1~eta2,Z2~eta2,Z3~eta2+X3))
covariance(m) <- eta1 ~ eta2
latent(m) <- ~eta1+eta2

e.lvm <- estimate(m,d)
e2.lvm <- e.lvm
sCorrect(e2.lvm) <- FALSE

## ** check score, residuals, vcov at ML
test_that("2 factor model with covariance (at ML) compared to lava",{

    expect_equivalent(e2.lvm$sCorrect$vcov.param, vcov(e.lvm))
    expect_true(all(e2.lvm$sCorrect$leverage==0))
    expect_true(all(e2.lvm$sCorrect$n.corrected==e.lvm$data$n))
    expect_equivalent(e2.lvm$sCorrect$residuals, residuals(e.lvm))
    expect_equal(e2.lvm$sCorrect$param, coef(e.lvm))
    expect_equal(e2.lvm$sCorrect$score, score(e.lvm, indiv = TRUE))
    expect_equal(score2(e.lvm, bias.correct = FALSE), score(e.lvm, indiv = TRUE))

})

## ** check score not at ML
param <- coef(e.lvm)
test <- score2(e.lvm, p = param+1, bias.correct = FALSE)
GS <- score(e.lvm, p = param+1, indiv = TRUE)

test_that("2 factor model with covariance (not at ML: +1)",{
    expect_equal(test, GS)
})

test <- score2(e.lvm, p = param+0.1*(1:length(param)), bias.correct = FALSE)
GS <- score(e.lvm, p = param+0.1*(1:length(param)), indiv=TRUE)
test_that("2 factor model with covariance (not at ML: +1:p)",{
    expect_equal(test, GS)
})

## * LVM: 2 factor model (correlation LV)
## ** model fit and sCorrect
m <- lvm(c(Y1~eta1,Y2~eta1,Y3~eta1+X1,
           Z1~eta2,Z2~eta2,Z3~eta2+X3))
regression(m) <- eta2 ~ X1
regression(m) <- eta1 ~ eta2+X2+X3

e.lvm <- estimate(m,d)

e2.lvm <- e.lvm
sCorrect(e2.lvm) <- FALSE

## ** check score, residuals, vcov at ML
test_that("2 factor model with correlation (at ML) compared to lava",{

    expect_equivalent(e2.lvm$sCorrect$vcov.param, vcov(e.lvm))
    expect_true(all(e2.lvm$sCorrect$leverage==0))
    expect_true(all(e2.lvm$sCorrect$n.corrected==e.lvm$data$n))
    expect_equivalent(e2.lvm$sCorrect$residuals, residuals(e.lvm))
    expect_equal(e2.lvm$sCorrect$param, coef(e.lvm))
    expect_equal(e2.lvm$sCorrect$score, score(e.lvm, indiv = TRUE))
    expect_equal(score2(e.lvm, bias.correct = FALSE), score(e.lvm, indiv = TRUE))

})

## ** check score not at ML
param <- coef(e.lvm)
test <- score2(e.lvm, p = param+1, bias.correct = FALSE)
GS <- score(e.lvm, p = param+1, indiv = TRUE)

test_that("2 factor model (not at ML: +1)",{
    expect_equal(test, GS)
})

test <- score2(e.lvm, p = param+0.1*(1:length(param)), bias.correct = FALSE)
GS <- score(e.lvm, p = param+0.1*(1:length(param)), indiv=TRUE)
test_that("2 factor model (not at ML: +1:p)",{
    expect_equal(test, GS)
})


##----------------------------------------------------------------------
### test1-sCorrect-lava.R ends here
