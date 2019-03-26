### test-Utils-nlme.R --- 
##----------------------------------------------------------------------
## Author: Brice Ozenne
## Created: nov 16 2017 (10:36) 
## Version: 
## Last-Updated: dec 10 2018 (23:44) 
##           By: Brice Ozenne
##     Update #: 69
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

library(nlme)
lava.options(symbols = c("~","~~"))

context("Utils-nlme")

## * simulation
n <- 5e1
mSim <- lvm(c(Y1~1*eta,Y2~1*eta,Y3~1*eta,Y4~1*eta,eta~G+Gender))
latent(mSim) <- ~eta
categorical(mSim, labels = c("M","F")) <- ~Gender
transform(mSim,Id~Y1) <- function(x){1:NROW(x)}
set.seed(10)
dW <- lava::sim(mSim,n,latent = FALSE)
dW <- dW[order(dW$Id),,drop=FALSE]
dL <- reshape2::melt(dW,id.vars = c("G","Id","Gender"), variable.name = "time")
dL <- dL[order(dL$Id),,drop=FALSE]
dL$time.num <- as.numeric(dL$time)

## * t.test
test_that("invariant to the order in the dataset", {
    e1.gls <- gls(Y1 ~ Gender, data = dW[order(dW$Id),],
                  weights = varIdent(form = ~1|Gender),
                  method = "ML")

    out1 <- getVarCov2(e1.gls, cluster = dW$Id)
    index.cluster <- as.numeric(names(out1$index.Omega))
    expect_true(all(diff(index.cluster)>0))

    e2.gls <- gls(Y1 ~ Gender, data = dW[order(dW$Gender),],
                  weights = varIdent(form = ~1|Gender),
                  method = "ML")
    out2 <- getVarCov2(e2.gls, cluster = dW$Id)
    index.cluster <- as.numeric(names(out2$index.Omega))
    expect_true(all(diff(index.cluster)>0))
})

## * Heteroschedasticity
e.gls <- nlme::gls(value ~ time + G + Gender,
                   weights = varIdent(form =~ 1|time),
                   data = dL, method = "ML")

test_that("Heteroschedasticity", {
    vec.sigma <- c(1,coef(e.gls$modelStruct$varStruct, unconstrained = FALSE))
    expect_equal(diag(vec.sigma^2 * sigma(e.gls)^2),
                 unname(getVarCov2(e.gls, cluster = "Id")$Omega))
})

## * Compound symmetry
e.lme <- nlme::lme(value ~ time + G + Gender,
                   random = ~ 1|Id,
                   data = dL,
                   method = "ML")
e.lme.bis <- nlme::lme(value ~ time + G + Gender,
                       random = ~ 1|Id,
                       correlation = corCompSymm(),
                       data = dL,
                       method = "ML")
e.gls <- nlme::gls(value ~ time + G + Gender,
                   correlation = corCompSymm(form=~ 1|Id),
                   data = dL, method = "ML")

test_that("Compound symmetry", {
    expect_equal(unclass(getVarCov(e.gls)),
                 unname(getVarCov2(e.gls)$Omega))

    expect_equal(unname(getVarCov(e.lme, type = "marginal", individuals = 1)[[1]]),
                 unname(getVarCov2(e.lme)$Omega))

    expect_equal(unname(getVarCov(e.lme.bis, type = "marginal", individuals = 1)[[1]]),
                 unname(getVarCov2(e.lme.bis)$Omega))
})

## * Unstructured 
e.lme <- nlme::lme(value ~ time + G + Gender,
                   random = ~ 1|Id,
                   correlation = corSymm(form =~ time.num|Id),
                   data = dL,
                   method = "ML")
e.gls <- nlme::gls(value ~ time + G + Gender,
                   correlation = corSymm(form=~ time.num|Id),
                   data = dL, method = "ML")


test_that("Unstructured ", {
    expect_equal(unclass(getVarCov(e.gls)),
                 unname(getVarCov2(e.gls)$Omega))

    expect_equal(unname(getVarCov(e.lme, type = "marginal", individuals = 1)[[1]]),
                 unname(getVarCov2(e.lme)$Omega))
})

## * Unstructured with weights
e.lme <- nlme::lme(value ~ time + G + Gender,
                   random = ~ 1|Id,
                   correlation = corSymm(form =~ time.num|Id),
                   weight = varIdent(form = ~ 1|time),
                   data = dL,
                   method = "ML")
e.gls <- nlme::gls(value ~ time + G + Gender,
                   correlation = corSymm(form =~ time.num|Id),
                   weight = varIdent(form = ~ 1|time),
                   data = dL, method = "ML")

test_that("Unstructured with weights", {
    expect_equal(unclass(getVarCov(e.gls)),
                 unname(getVarCov2(e.gls)$Omega))

    expect_equal(unname(getVarCov(e.lme, type = "marginal", individuals = 1)[[1]]),
                 unname(getVarCov2(e.lme)$Omega))
})

## * Unstructured with missing data
## http://publicifsv.sund.ku.dk/~jufo/courses/rm2018/vasscores.txt
## fix bug in the ordering of getVarCov2 due to different ordering of treatment in arguments weight and correlation

## ** data management
## butils::object2script(dfW.score)
dfW <- data.frame("id" = c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30"), 
                  "group" = c("AC", "AB", "AB", "BC", "BC", "AC", "AB", "AC", "BC", "AC", "BC", "AB", "AB", "BC", "AB", "AC", "BC", "AC", "AC", "AC", "BC", "AB", "AB", "BC", "AB", "AB", "BC", "AC", "BC", "AC"), 
                  "vasaucA" = c( 51.0,  42.0,  54.0, NA, NA,  16.5,  58.5, 129.0, NA,  52.5, NA,  23.5,  98.0, NA, 177.0,  67.0, NA,  55.0,  79.5,   3.5, NA,  33.0,   9.5, NA,  47.5,  66.5, NA,  85.5, NA, 143.5), 
                  "vasaucB" = c(NA,  35.0,  62.0,  64.0,  80.5, NA,  33.5, NA,  59.0, NA,  32.5,  13.0, 120.0, 102.0, 166.5, NA, 138.0, NA, NA, NA, 161.5,  53.5,  13.5, 116.5,  68.0, 104.5, 103.0, NA,  36.0, NA), 
                  "vasaucC" = c( 48.5, NA, NA,  65.0,  94.5,  19.5, NA, 102.0,  56.5,  78.5,  18.0, NA, NA,  14.0, NA,  51.0, 168.5,  10.0,  28.0,   3.5, 127.0, NA, NA,  36.5, NA, NA,  33.5,  45.0,   7.5, 132.0))

level.Id <- sort(as.numeric(as.character(dfW$id)))

dfW$id <- factor(dfW$id, levels = level.Id)
dfW$group <- as.factor(dfW$group)
dfL <- reshape2::melt(dfW, id.vars = c("id","group"),
                      measure.vars = c("vasaucA","vasaucB","vasaucC"),
                      value.name = "vasauc",
                      variable.name = "treatment")
dfL <- dfL[order(dfL$id, dfL$treatment),]
dfL$treatment <- gsub("vasauc","",dfL$treatment)
dfL$treatment <- as.factor(dfL$treatment)
dfL$treatment.num <- as.numeric(dfL$treatment)


dfL2 <- dfL
dfL2$id <- as.character(dfL2$id)
dfL2[dfL2$id == "2","id"] <- "0"
dfL2[dfL2$id == "1","id"] <- "2"
dfL2[dfL2$id == "0","id"] <- "1"
dfL2$id <- factor(dfL2$id, levels = level.Id)
dfL2 <- dfL2[order(dfL2$id,dfL2$treatment),]


## ** fit model
e.gls <- gls(vasauc ~ treatment,
             correlation = corSymm(form =~ treatment.num | id),
             weights = varIdent(form =~ 1|treatment),
             na.action = na.omit,
             data = dfL)
logLik(e.gls)

e.gls2 <- gls(vasauc ~ treatment,
             correlation = corSymm(form =~ treatment.num | id),
             weights = varIdent(form =~ 1|treatment),
             na.action = na.omit,
             data = dfL2)
logLik(e.gls2)

## ** extract covariance matrix
Sigma <- unname(getVarCov2(e.gls)$Omega)
Sigma2 <- unname(getVarCov2(e.gls2)$Omega)

expect_equal(Sigma, Sigma2, tol = 1e-5)
## allcoef <- lavaSearch2:::.coef2.gls(e.gls)
## sigmaBase <- allcoef["sigma2"] * c(A=1,allcoef["B"],allcoef["C"])

## AB
expect_equal(Sigma[c(1,2),c(1,2)],
             unclass(nlme::getVarCov(e.gls2, individual = 1)),
             tol = 1e-5)
expect_equal(Sigma[c(1,2),c(1,2)],
             unclass(nlme::getVarCov(e.gls, individual = 2)),
             tol = 1e-5)
## sqrt(sigmaBase["A"] * sigmaBase["B"]) * allcoef["corCoefAB"]

## AC
expect_equal(Sigma[c(1,3),c(1,3)],
             unclass(nlme::getVarCov(e.gls2, individual = 2)),
             tol = 1e-5)
expect_equal(Sigma[c(1,3),c(1,3)],
             unclass(nlme::getVarCov(e.gls, individual = 1)),
             tol = 1e-5)
## sqrt(sigmaBase["A"] * sigmaBase["C"]) * allcoef["corCoefAC"]

## BC
expect_equal(Sigma[c(2,3),c(2,3)],
             unclass(nlme::getVarCov(e.gls2, individual = 4)),
             tol = 1e-5)
expect_equal(Sigma[c(2,3),c(2,3)],
             unclass(nlme::getVarCov(e.gls, individual = 4)),
             tol = 1e-5)
## sqrt(sigmaBase["B"] * sigmaBase["C"]) * allcoef["corCoefBC"]


## * 2 random effect model (error)
e.lme <- nlme::lme(value ~ time + G + Gender,
                   random=~1|Id/Gender,
                   data = dL,
                   method = "ML")

expect_error(getVarCov2(e.lme))

## * PET dataset

df.PET <- data.frame("ID" = c( 925, 2020, 2059, 2051, 2072, 2156, 2159, 2072, 2020, 2051, 2231,
                              2738, 2231, 2777,  939,  539, 2738, 2777,  925, 2156, 2159, 2059), 
                     "session" = c("V", "V", "V", "V", "V", "V", "V", "C", "C", "C", "C",
                                   "C", "V", "C", "C", "V", "V", "V", "C", "C", "C", "C"), 
                     "PET" = c(-2.53, -6.74, -8.17, -2.44, -3.54, -1.27, -0.55, -0.73, -1.42,  3.35,
                               -2.11,  2.60, -4.52,  0.99, -1.02, -1.78, -5.86,  1.20, NA, NA, NA, NA)
                     )
df.PET$session.index <- as.numeric(as.factor(df.PET$session))


e.lme <- lme(PET ~ session,
             random = ~ 1 | ID,
             weights = varIdent(form=~session.index|session),
             na.action = "na.omit",
             data = df.PET)
test_that("getVarCov2 - NA", {
    expect_equal(matrix(c( 7.893839, 1.583932, 1.583932, 4.436933), 2, 2),
                 unname(getVarCov2(e.lme)$Omega), tol = 1e-6, scale = 1)
})


##----------------------------------------------------------------------
### test-Utils-nlme.R ends here
