### test1-sCorrect-missingValues.R --- 
##----------------------------------------------------------------------
## Author: Brice Ozenne
## Created: mar  7 2018 (13:39) 
## Version: 
## Last-Updated: feb 11 2019 (14:32) 
##           By: Brice Ozenne
##     Update #: 36
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
.coef2 <- lavaSearch2:::.coef2
library(nlme)
context("sCorrect (dealing with missing values)")

## * simulation
n <- 2e1
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
dLred2 <- dL[dL$variable %in% c("Y1","Y2"),]
dLred3 <- dLred2
dLred3[dL$variable == "Y2","Id"] <- paste0("-",dLred3[dL$variable == "Y2","Id"])

## ** t test
## formula:
## df = \frac{ 2 * s_pool^2 }{ var(s_pool^2) }
##    = \frac{ ( s_X^2/m + s_Y^2/n )^2}{( s_X^4/(m(m-1)) + s_Y^4/(n(n-1)))}

## using the t test function
e.ttest <- t.test(d$Y1, d$Y2)
e.ttest$parameter

## by hand
sX1 <- var(d$Y1)/n
sX2 <- var(d$Y2)/n
df <- (sX1+sX2)^2/(sX1^2/(n-1) + sX2^2/(n-1))
df-e.ttest$parameter

## *** using gls - no missing data
e.gls <- gls(value ~ variable, data = dLred2,
             weights = varIdent(form = ~1|variable),
             method = "ML")

expect_equal(as.double(coef(e.gls)[2]),
             as.double(diff(e.ttest$estimate)))

test_that("t test (full data)", {
    eS.gls <- summary2(e.gls, cluster = "Id")$tTable
    expect_equal(unname(e.ttest$parameter),
                 eS.gls["variableY2","df"],
                 tol = 1e-3)
    expect_equal(unname(e.ttest$p.value),
                 eS.gls["variableY2","p-value"],
                 tol = 1e-5)
})

## *** using gls - missing data
eNA.gls <- gls(value ~ variable, data = dLred3,
               weights = varIdent(form = ~1|variable),
               method = "ML")

expect_equal(as.double(coef(eNA.gls)[2]),
             as.double(diff(e.ttest$estimate)))
## getVarCov2(eNA.gls, cluster = "Id")



test_that("t test (missing data)", {
    eNAS.gls <- summary2(eNA.gls, cluster = "Id")$tTable
    
    expect_equal(unname(e.ttest$parameter),
                 eNAS.gls["variableY2","df"],
                 tol = 1e-3)
    expect_equal(unname(e.ttest$p.value),
                 eNAS.gls["variableY2","p-value"],
                 tol = 1e-5)
})

## * LVM: factor model
m <- lvm(c(Y1~eta1,Y2~eta1,Y3~eta1+X1))
regression(m) <- eta1~X1+X2

e.lvm <- estimate(m,d)
e2.lvm <- e.lvm
sCorrect(e2.lvm) <- TRUE

## ** complete case analysis
missing.Row <- d[1,]
missing.Row[,"Id"] <- -1
missing.Row[,c("Y1","Y2","Y3")] <- NA
eNA.lvm <- estimate(m, rbind(d,missing.Row), missing = FALSE)

test_that("complete case analysis (factor model)", {
    eNA2.lvm <- eNA.lvm
    sCorrect(eNA2.lvm) <- TRUE

    expect_equal(eNA2.lvm$sCorrect,
                 e2.lvm$sCorrect)
})

## ** full information
missing.Row <- d[1,]
missing.Row[,"Id"] <- -1
missing.Row[,c("Y1","Y2")] <- NA
eNA.lvm <- estimate(m, rbind(d,missing.Row), missing = TRUE)

test_that("full information (factor model)", {
    eNA2.lvm <- eNA.lvm
    sCorrect(eNA2.lvm) <- TRUE
    ## sCorrect(eNA2.lvm, numeric.derivative = TRUE) <- TRUE
    summary2(eNA2.lvm)
})



##----------------------------------------------------------------------
### test1-sCorrect-missingValues.R ends here
