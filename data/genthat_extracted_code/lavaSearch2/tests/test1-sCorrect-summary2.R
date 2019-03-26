### test1-sCorrect-summary2.R --- 
##----------------------------------------------------------------------
## Author: Brice Ozenne
## Created: apr  4 2018 (13:29) 
## Version: 
## Last-Updated: mar  4 2019 (18:52) 
##           By: Brice Ozenne
##     Update #: 51
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

    printDF <- function(object, bias.correct){
        colDF <- summary2(object, bias.correct = bias.correct)$coef[,"df",drop=FALSE]
        n.coef <- NROW(colDF)
        vec.end <- c(rep(",",n.coef-1),")")
        vec.start <- c("c(", rep("",n.coef-1))        
        df <- data.frame(paste0(vec.start,"\"",rownames(colDF),"\""),
                         "=",
                         paste0(colDF[,1],vec.end))
        names(df) <- NULL
        print(df, row.names = FALSE)
    }

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

## * linear regression 
## ** model fit
e.lvm <- estimate(lvm(Y1~X1+X2+Gender), data = d)

## ** test df
test_that("linear regression: Satterthwaite (df)", {
    ## printDF(e.lvm, bias.correct = FALSE)
    df <- c("Y1~X1" = 50,
            "Y1~X2" = 50,
            "Y1~GenderFemale" = 50,
            "Y1~~Y1" = 12.5,
            "Y1" = 50)
    expect_equal(as.double(df),
                 summary2(e.lvm, bias.correct = FALSE)$coef$df)
})

test_that("linear regression: Satterthwaite + SSC (df)", {
    ## printDF(e.lvm, bias.correct = TRUE)
    df <- c("Y1~X1" =   46,
            "Y1~X2" =   46,
            "Y1~GenderFemale" =   46,
            "Y1~~Y1" = 11.5,
            "Y1" =   46)
    expect_equal(as.double(df),
                 summary2(e.lvm, bias.correct = TRUE)$coef$df)
})

## ** robust standard error
test_that("linear regression: robust SE", {
    ## printDF(e.lvm, bias.correct = TRUE)
    eS0 <- summary2(e.lvm, robust = TRUE, df = TRUE)$coef
    eS1 <- summary2(e.lvm, robust = TRUE, df = 2)$coef
    eS2 <- summary2(e.lvm, robust = TRUE, df = 2, cluster = 1:n)$coef
    expect_equal(eS1,eS2)
    
    df <- c("Y1~X1" =   46,
            "Y1~X2" =   46,
            "Y1~GenderFemale" =   46,
            "Y1~~Y1" = 11.5,
            "Y1" =   46)
    expect_equal(as.double(df),
                 eS0$df, tol = 1e-2)
    
    df <- c("Y1~X1" = 43.194962,   
            "Y1~X2" = 48.765588,
            "Y1~GenderFemale" = 52.687514,
            "Y1~~Y1" = 9.694972,
            "Y1" = 42.373871)
    expect_equal(as.double(df),
                 eS1$df, tol = 1e-2)
})

## * linear regression with constrains 
## ** model fit
e.lvm <- estimate(lvm(Y1[0:2]~X1+1*X2), data = d)

e.lvm2 <- estimate(lvm(Y1~beta*X1+beta*X2), d)


## ** test df
test_that("linear regression with constrains: Satterthwaite (df)", {
    expect_equal(summary2(e.lvm)$coef$df,c(Inf,NA,NA)) ## Inf since the variance coefficient is known
    ## printDF(e.lvm2, bias.correct = FALSE)
    df <- c("Y1~X1" =   50,
            "Y1~X2" =   NA,
            "Y1~~Y1" = 12.5,
            "Y1" =   50)
    expect_equal(summary2(e.lvm2, bias.correct = FALSE)$coef$df,
                 as.double(df))
})

test_that("linear regression with constrains: Satterthwaite + SSC (df)", {
    expect_equal(summary2(e.lvm)$coef$df,c(Inf,NA,NA)) ## Inf since the variance coefficient is known
    ## printDF(e.lvm2, bias.correct = TRUE)
    df <- c("Y1~X1" =   48,
            "Y1~X2" =   NA,
            "Y1~~Y1" = 12,
            "Y1" =   48)
    expect_equal(summary2(e.lvm2, bias.correct = TRUE)$coef$df,
                 as.double(df))
})

## * multiple linear regression 
## ** model fit
ls.lm <- list(lm(Y1~X1,d),lm(Y2~X2,d),lm(Y3~X1+X3,d))
e.lvm <- estimate(lvm(Y1~X1,Y2~X2,Y3~X1+X3), data = d)

## ** test df
test_that("multiple linear regression: Satterthwaite (df)", {
    ## printDF(e.lvm, bias.correct = FALSE)
    df <- c("Y1~X1" =   50,
            "Y2~X2" =   50,
            "Y3~X1" =   50,
            "Y3~X3" =   50,
            "Y1~~Y1" = 12.5,
            "Y2~~Y2" = 12.5,
            "Y3~~Y3" = 12.5,
            "Y1" =   50,
            "Y2" =   50,
            "Y3" =   50)
    expect_equal(summary2(e.lvm, bias.correct = FALSE)$coef$df,
                 as.double(df)) ## 
    
})

test_that("multiple linear regression: Satterthwaite + SSC (df)", {
    ## printDF(e.lvm, bias.correct = TRUE)
    df <- c("Y1~X1" =    48,
            "Y2~X2" =    48,
            "Y3~X1" =    47,
            "Y3~X3" =    47,
            "Y1~~Y1" =    12,
            "Y2~~Y2" =    12,
            "Y3~~Y3" = 11.75,
            "Y1" =    48,
            "Y2" =    48,
            "Y3" =    47)
    expect_equal(summary2(e.lvm, bias.correct = TRUE)$coef$df,
                 as.double(df)) ## 
    
})

## * multiple linear regression with constrains 
## ** model fit
e.lvm <- estimate(lvm(Y1~X1+1*X2,Y2~2*X3+2*X1,Y3~X2), data = d)

## ** test df
test_that("multiple linear regression with constrains: Satterthwaite (df)", {
    ## printDF(e.lvm, bias.correct = FALSE)
    df <- c("Y1~X1" =   50,
            "Y1~X2" =   NA,
            "Y2~X1" =   NA,
            "Y2~X3" =   NA,
            "Y3~X2" =   50,
            "Y1~~Y1" = 12.5,
            "Y2~~Y2" = 12.5,
            "Y3~~Y3" = 12.5,
            "Y1" =   50,
            "Y2" =   50,
            "Y3" =   50)
    expect_equal(summary2(e.lvm, bias.correct = FALSE)$coef$df,
                 as.double(df)) ## 
    
})
test_that("multiple linear regression with constrains: Satterthwaite + SSC (df)", {
    ## printDF(e.lvm, bias.correct = TRUE)
    df <- c("Y1~X1" =    48,
            "Y1~X2" =    NA,
            "Y2~X1" =    NA,
            "Y2~X3" =    NA,
            "Y3~X2" =    48,
            "Y1~~Y1" =    12,
            "Y2~~Y2" = 12.25,
            "Y3~~Y3" =    12,
            "Y1" =    48,
            "Y2" =    49,
            "Y3" =    48)
    expect_equal(summary2(e.lvm, bias.correct = TRUE)$coef$df,
                 as.double(df)) ## 
    
})

## * multiple linear regression with covariance links 
## ** model fit
e.lvm <- estimate(lvm(Y1~X1+X2,Y2~X3+X1,Y3~X2,Y1~~Y2),d)

## ** test df
test_that("multiple linear regression with covariance: Satterthwaite (df)", {
    ## printDF(e.lvm, bias.correct = FALSE)
    df <- c("Y1~X1" = 50.0023249929247,
            "Y1~X2" = 50.0557533452502,
            "Y2~X1" = 50.1412333709522,
            "Y2~X3" = 50.0557533452502,
            "Y3~X2" =               50,
            "Y1~~Y1" =             12.5,
            "Y1~~Y2" = 14.4382586892588,
            "Y2~~Y2" =             12.5,
            "Y3~~Y3" =             12.5,
            "Y1" = 51.0449669789772,
            "Y2" = 50.0000667169911,
            "Y3" =               50)
    expect_equal(summary2(e.lvm, bias.correct = FALSE)$coef$df,
                 as.double(df)) ## 
    
})

test_that("multiple linear regression with covariance: Satterthwaite +SSC (df)", {
    ## printDF(e.lvm, bias.correct = TRUE)
    df <- c("Y1~X1" = 47.0021511585814,
            "Y1~X2" = 47.0515840309539,
            "Y2~X1" = 47.1306527469107,
            "Y2~X3" = 47.0515840309539,
            "Y3~X2" =               48,
            "Y1~~Y1" =            11.75,
            "Y1~~Y2" = 13.6588307493286,
            "Y2~~Y2" =            11.75,
            "Y3~~Y3" =               12,
            "Y1" = 47.9656506208306,
            "Y2" = 47.0000617288762,
            "Y3" =               48)
    expect_equal(summary2(e.lvm, bias.correct = TRUE)$coef$df,
                 as.double(df)) ## 
    
})

## * mixed model: Compound symmetry 
## ** model fit
m <- lvm(Y1[mu1:sigma]~1*eta,
         Y2[mu2:sigma]~1*eta,
         Y3[mu3:sigma]~1*eta,
         eta~X1+Gender)
e.lvm <- estimate(m, d)

## ** test df
test_that("compound symmetry: Satterthwaite (df)", {
    ## printDF(e.lvm, bias.correct = FALSE)
    df <- c("Y1~eta" =               NA,
            "eta~X1" =               50,
            "eta~GenderFemale" = 49.9999999999999,
            "Y2~eta" =               NA,
            "Y3~eta" =               NA,
            "Y1~~Y1" =               25,
            "eta~~eta" = 14.9861363947381,
            "Y2~~Y2" =               NA,
            "Y3~~Y3" =               NA,
            "Y1" =               NA,
            "eta" = 91.8352861647611,
            "Y2" = 99.9999999999999,
            "Y3" =              100)
    expect_equal(summary2(e.lvm, bias.correct = FALSE)$coef$df,
                 as.double(df)) ## 
    
})

test_that("compound symmetry: Satterthwaite + SSC (df)", {
    ## printDF(e.lvm, bias.correct = TRUE)
    df <- c("Y1~eta" =               NA,
            "eta~X1" = 48.3333333333333,
            "eta~GenderFemale" = 48.3333333333334,
            "Y2~eta" =               NA,
            "Y3~eta" =               NA,
            "Y1~~Y1" = 24.1666666666667,
            "eta~~eta" = 14.2918140430781,
            "Y2~~Y2" =               NA,
            "Y3~~Y3" =               NA,
            "Y1" =               NA,
            "eta" = 87.2184581017777,
            "Y2" = 96.6666666666667,
            "Y3" = 96.6666666666667)
    expect_equal(summary2(e.lvm, bias.correct = TRUE)$coef$df,
                 as.double(df)) ## 
    
})

## * mixed model: CS with different variances 
## ** model fit 
m <- lvm(c(Y1[mu1:sigma1]~1*eta,
           Y2[mu2:sigma2]~1*eta,
           Y3[mu3:sigma3]~1*eta,
           eta~X1+Gender))
latent(m) <- ~eta
e.lvm <- estimate(m, d)

## ** test df
test_that("compound symmetry with different variances: Satterthwaite (df)", {
    ## printDF(e.lvm, bias.correct = FALSE)
    df <- c("Y1~eta" =               NA,
            "eta~X1" =               50,
            "eta~GenderFemale" =               50,
            "Y2~eta" =               NA,
            "Y3~eta" =               NA,
            "Y1~~Y1" = 13.7622127329219,
            "eta~~eta" = 14.9076367038288,
            "Y2~~Y2" = 13.1071601322285,
            "Y3~~Y3" = 12.9639539581698,
            "Y1" =               NA,
            "eta" =  62.670059576658,
            "Y2" = 61.7435858694498,
            "Y3" = 62.9968941834921)
    expect_equal(summary2(e.lvm, bias.correct = FALSE)$coef$df,
                 as.double(df)) ## 
    
})

test_that("compound symmetry with different variances: Satterthwaite + SSC (df)", {
    ## printDF(e.lvm, bias.correct = TRUE)
    df <- c("Y1~eta" =               NA,
            "eta~X1" = 48.3090185442116,
            "eta~GenderFemale" = 48.3090185442116,
            "Y2~eta" =               NA,
            "Y3~eta" =               NA,
            "Y1~~Y1" = 13.2163927334731,
            "eta~~eta" =  14.217415837608,
            "Y2~~Y2" = 12.6752803879324,
            "Y3~~Y3" = 12.5558385456554,
            "Y1" =               NA,
            "eta" = 60.2494643343862,
            "Y2" = 59.2748591852783,
            "Y3" = 60.5251223192755)
    expect_equal(summary2(e.lvm, bias.correct = TRUE)$coef$df,
                 as.double(df)) ## 
    
})

## * mixed model: Unstructured 
## ** model fit 
m <- lvm(Y1[mu1:sigma]~1*eta,
         Y2[mu2:sigma]~1*eta,
         Y3[mu3:sigma]~1*eta,
         eta~X1+Gender)
covariance(m) <- Y1~Y2
covariance(m) <- Y1~Y3
e.lvm <- estimate(m, d)

## ** test df
test_that("Unstructured: Satterthwaite (df)", {
    ## printDF(e.lvm, bias.correct = FALSE)
    df <- c("Y1~eta" =               NA,
            "eta~X1" =               50,
            "eta~GenderFemale" =               50,
            "Y2~eta" =               NA,
            "Y3~eta" =               NA,
            "Y1~~Y1" = 17.5643964155044,
            "Y1~~Y2" = 26.5641253277581,
            "Y1~~Y3" = 27.0682699161553,
            "eta~~eta" =  28.574875590729,
            "Y2~~Y2" =               NA,
            "Y3~~Y3" =               NA,
            "Y1" =               NA,
            "eta" = 91.2264371148653,
            "Y2" = 53.4049195968228,
            "Y3" = 53.5959248802897)
    expect_equal(summary2(e.lvm, bias.correct = FALSE)$coef$df,
                 as.double(df)) ## 
   
})

test_that("Unstructured: Satterthwaite + SSC (df)", {
    ## printDF(e.lvm, bias.correct = TRUE)
    df <- c("Y1~eta" =               NA,
            "eta~X1" = 48.3224853449504,
            "eta~GenderFemale" = 48.3224853449505,
            "Y2~eta" =               NA,
            "Y3~eta" =               NA,
            "Y1~~Y1" = 16.7854424067793,
            "Y1~~Y2" = 25.5782787764655,
            "Y1~~Y3" = 26.0669936093665,
            "eta~~eta" = 26.8150959679397,
            "Y2~~Y2" =               NA,
            "Y3~~Y3" =               NA,
            "Y1" =               NA,
            "eta" = 86.6593055939208,
            "Y2" = 51.5324014285871,
            "Y3" = 51.7048594272516)
    expect_equal(summary2(e.lvm, bias.correct = TRUE)$coef$df,
                 as.double(df)) ## 
   
})

## * mixed model: Unstructured with weights 
## ** model fit
m <- lvm(Y1~1*eta,
         Y2~1*eta,
         Y3~1*eta,
         eta~X1+Gender)
covariance(m) <- Y1~Y2
covariance(m) <- Y1~Y3
e.lvm <- estimate(m, d)

## ** test df
test_that("Unstructured with different variances: Satterthwaite (df)", {
    ## printDF(e.lvm, bias.correct = FALSE)
    df <- c("Y1~eta" =               NA,
            "eta~X1" =               50,
            "eta~GenderFemale" =               50,
            "Y2~eta" =               NA,
            "Y3~eta" =               NA,
            "Y1~~Y1" = 29.4058931067402,
            "Y1~~Y2" =  24.123892562579,
            "Y1~~Y3" = 23.8490532004303,
            "eta~~eta" = 21.6480839727271,
            "Y2~~Y2" = 13.9484476182045,
            "Y3~~Y3" = 13.6295423667226,
            "Y1" =               NA,
            "eta" = 61.9919494846624,
            "Y2" =               50,
            "Y3" =               50)
    expect_equal(summary2(e.lvm, bias.correct = FALSE)$coef$df,
                 as.double(df)) ## 
   
})

test_that("Unstructured with different variances: Satterthwaite + SSC(df)", {
    ## printDF(e.lvm, bias.correct = TRUE)
    df <-  c("Y1~eta" =               NA,
             "eta~X1" = 48.3304216261627,
             "eta~GenderFemale" = 48.3304216261627,
             "Y2~eta" =               NA,
             "Y3~eta" =               NA,
             "Y1~~Y1" = 28.3183276959291,
             "Y1~~Y2" = 23.3515179666561,
             "Y1~~Y3" =  23.067088992202,
             "eta~~eta" = 20.5208370543495,
             "Y2~~Y2" = 13.5374504027834,
             "Y3~~Y3" = 13.2154882614502,
             "Y1" =               NA,
             "eta" = 59.5876907394727,
             "Y2" =  48.303327990695,
             "Y3" = 48.3503310393569)
    expect_equal(summary2(e.lvm, bias.correct = TRUE)$coef$df,
                 as.double(df)) ## 
   
})

## * LVM: factor model
## ** model fit
m <- lvm(c(Y1~eta1,Y2~eta1,Y3~eta1+X1))
regression(m) <- eta1~X1+X2

e.lvm <- estimate(m,d)

## ** test df
test_that("factor model: Satterthwaite (df)", {
    ## printDF(e.lvm, bias.correct = FALSE)
    df <- c("Y1~eta1" =               NA,
            "eta1~X1" = 58.4757554282479,
            "eta1~X2" = 10.8872653678716,
            "Y2~eta1" =  12.650352895762,
            "Y3~eta1" = 1.66449902683186,
            "Y3~X1" = 1.94477624007772,
            "Y1~~Y1" = 13.4119782396656,
            "eta1~~eta1" = 9.77837284896349,
            "Y2~~Y2" = 13.1191680921666,
            "Y3~~Y3" = 3.08049854039328,
            "Y1" =               NA,
            "eta1" = 53.5326429983215,
            "Y2" = 33.8519195633547,
            "Y3" = 5.63733433999094)
    expect_equal(summary2(e.lvm, bias.correct = FALSE)$coef$df,
                 as.double(df)) ## 
   
})

test_that("factor model: Satterthwaite + SSC (df)", {
    ## printDF(e.lvm, bias.correct = TRUE)
    df <- c("Y1~eta1" =               NA,
            "eta1~X1" = 55.6095030455868,
            "eta1~X2" =   10.69185489681,
            "Y2~eta1" = 12.0538338192516,
            "Y3~eta1" = 1.68984160423946,
            "Y3~X1" = 1.98887307453212,
            "Y1~~Y1" = 12.7884282564093,
            "eta1~~eta1" = 9.24396149670392,
            "Y2~~Y2" = 12.5520589048566,
            "Y3~~Y3" = 3.19288665194889,
            "Y1" =               NA,
            "eta1" =  51.033476570524,
            "Y2" = 32.4702969907481,
            "Y3" = 5.69386974149653)
    expect_equal(summary2(e.lvm, bias.correct = TRUE)$coef$df,
                 as.double(df)) ## 
   
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

## ** test df
test_that("factor model with constrains: Satterthwaite (df)", {
    ## printDF(e.lvm, bias.correct = FALSE)
    df <-  c("Y1~eta" =               NA,
             "Y1~X2" =               NA,
             "Y2~eta" =               NA,
             "Y3~eta" =               NA,
             "Y1~~Y1" = 13.0283303539105,
             "eta~~eta" = 13.3180611458203,
             "Y2~~Y2" = 14.6602148987303,
             "Y3~~Y3" =  13.336755056036,
             "Y1" =               NA,
             "eta" = 65.4311665778315,
             "Y2" = 55.8228293621142,
             "Y3" = 65.2565795061356)
    expect_equal(summary2(e.lvm, bias.correct = FALSE)$coef$df,
                 as.double(df)) ## 

    ## printDF(e.lvm2, bias.correct = FALSE)
    df <-  c("Y1~eta" =               NA,
             "Y1~X2" = 69.0600280017674,
             "eta~X2" = 72.4161865968702,
             "eta~X1" =               NA,
             "Y2~eta" = 9.69151052458835,
             "Y2~X2" = 79.5362655494372,
             "Y3~eta" =               NA,
             "Y1~~Y1" = 15.8090377333579,
             "eta~~eta" = 9.84379200456075,
             "Y2~~Y2" = 16.0628919232454,
             "Y3~~Y3" = 13.0030782764756,
             "Y1" =               NA,
             "eta" = 53.7056242594302,
             "Y2" = 33.2159634933677,
             "Y3" = 44.9825684761348)
    expect_equal(summary2(e.lvm2, bias.correct = FALSE)$coef$df,
                 as.double(df)) ## 

})

test_that("factor model with constrains: Satterthwaite (df)", {
    ## printDF(e.lvm, bias.correct = TRUE)
    df <- c("Y1~eta" =               NA,
            "Y1~X2" =               NA,
            "Y2~eta" =               NA,
            "Y3~eta" =               NA,
            "Y1~~Y1" = 12.7677637468323,
            "eta~~eta" = 13.0516999229039,
            "Y2~~Y2" = 14.3670106007557,
            "Y3~~Y3" = 13.0700199549153,
            "Y1" =               NA,
            "eta" = 64.1225432462749,
            "Y2" =  54.706372774872,
            "Y3" =  63.951447916013)
    expect_equal(summary2(e.lvm, bias.correct = TRUE)$coef$df,
                 as.double(df)) ##

    ## printDF(e.lvm2, bias.correct = TRUE)
    df <- c("Y1~eta" =               NA,
            "Y1~X2" =  65.226689786171,
            "eta~X2" = 68.3697577738816,
            "eta~X1" =               NA,
            "Y2~eta" = 9.28152750240834,
            "Y2~X2" = 75.9794793068646,
            "Y3~eta" =               NA,
            "Y1~~Y1" = 14.9386883202788,
            "eta~~eta" = 9.23004100483922,
            "Y2~~Y2" = 15.2672594957146,
            "Y3~~Y3" = 12.6319294995649,
            "Y1" =               NA,
            "eta" = 50.7582990669443,
            "Y2" = 31.4593748928189,
            "Y3" = 43.0867331053962)
    expect_equal(summary2(e.lvm2, bias.correct = TRUE)$coef$df,
                 as.double(df)) ##
   
})

## * LVM: 2 factor model
## ** model fit
m <- lvm(c(Y1~eta1,Y2~eta1,Y3~eta1+X1,
           Z1~eta2,Z2~eta2,Z3~eta2+X3))
regression(m) <- eta1~X1+X2
latent(m) <- ~eta1+eta2

e.lvm <- estimate(m,d)

## ** test df
test_that("2 factor model: Satterthwaite (df)", {
    ## printDF(e.lvm, bias.correct = FALSE)
    df <- c("Y1~eta1" =               NA,
            "eta1~X1" = 58.4757578087337,
            "eta1~X2" = 10.8872658714826,
            "Y2~eta1" = 12.6503503160925,
            "Y3~eta1" = 1.66449908523609,
            "Y3~X1" = 1.94477634615581,
            "Z1~eta2" =               NA,
            "Z2~eta2" = 5.13217660987868,
            "Z3~eta2" = 1.02808174561543,
            "Z3~X3" = 50.0000000000001,
            "Y1~~Y1" = 13.4119785866779,
            "eta1~~eta1" =  9.7783707750495,
            "Y2~~Y2" = 13.1191682660331,
            "Y3~~Y3" = 3.08049828807642,
            "Z1~~Z1" = 10.2604884164458,
            "eta2~~eta2" = 7.15722190963717,
            "Z2~~Z2" = 11.2873117817945,
            "Z3~~Z3" = 1.29830427629455,
            "Y1" =               NA,
            "eta1" = 53.5326451480583,
            "Y2" = 33.8519153928353,
            "Y3" = 5.63733390756826,
            "Z1" =               NA,
            "eta2" =               50,
            "Z2" = 12.8319846641959,
            "Z3" = 1.86432248627634)
    expect_equal(summary2(e.lvm, bias.correct = FALSE)$coef$df,
                 as.double(df)) ## 
   
})

test_that("2 factor model: Satterthwaite + SSC (df)", {
    ## printDF(e.lvm, bias.correct = TRUE)
    df <- c("Y1~eta1" =               NA,
            "eta1~X1" = 55.6095055473752,
            "eta1~X2" = 10.6918550078085,
            "Y2~eta1" = 12.0538312418171,
            "Y3~eta1" = 1.68984165232773,
            "Y3~X1" =  1.9888731675747,
            "Z1~eta2" =               NA,
            "Z2~eta2" = 4.29439517300613,
            "Z3~eta2" = 1.01287510875383,
            "Z3~X3" = 47.9896226830952,
            "Y1~~Y1" = 12.7884284893288,
            "eta1~~eta1" =  9.2439595074979,
            "Y2~~Y2" = 12.5520589907774,
            "Y3~~Y3" = 3.19288640546866,
            "Z1~~Z1" = 9.62175964330932,
            "eta2~~eta2" = 5.76218376653209,
            "Z2~~Z2" =  10.754309181554,
            "Z3~~Z3" =  1.3442891734018,
            "Y1" =               NA,
            "eta1" = 51.0334789747374,
            "Y2" = 32.4702926711208,
            "Y3" = 5.69386915546178,
            "Z1" =               NA,
            "eta2" = 48.2092603391128,
            "Z2" = 11.4347010520163,
            "Z3" = 1.70873484420441)
    expect_equal(summary2(e.lvm, bias.correct = TRUE)$coef$df,
                 as.double(df)) ## 
   
})

## * LVM: 2 factor model with constrains
## ** model fit
m <- lvm(Y1~1*eta1+X2,Y2~lambda*eta1+X2,Y3~lambda*eta1,eta1 ~ beta*X2+beta*X1,
         Z1~0+eta2,Z2~lambda*eta2,Z3~eta2)
e.lvm <- estimate(m, d)
e2.lvm <- e.lvm

## ** test df
test_that("2 factor model with constrains: Satterthwaite (df)", {
    ## printDF(e.lvm, bias.correct = FALSE)
    df <-  c("Y1~eta1" =               NA,
             "Y1~X2" = 71.8402328650548,
             "eta1~X2" = 70.4776885380334,
             "eta1~X1" =               NA,
             "Y2~eta1" = 11.6960236660969,
             "Y2~X2" = 81.3187195450428,
             "Y3~eta1" =               NA,
             "Z1~eta2" =               NA,
             "Z2~eta2" =               NA,
             "Z3~eta2" =  1.3843686550126,
             "Y1~~Y1" = 16.4264277692649,
             "eta1~~eta1" = 10.0266166285231,
             "Y2~~Y2" = 15.9811366004273,
             "Y3~~Y3" = 12.9879081515096,
             "Z1~~Z1" =  14.333152850676,
             "eta2~~eta2" = 10.3356317755694,
             "Z2~~Z2" =  14.049054309863,
             "Z3~~Z3" = 3.85929725387927,
             "Y1" =               NA,
             "eta1" = 53.6044335618639,
             "Y2" = 36.2614266452424,
             "Y3" = 47.3109927669215,
             "Z1" =               NA,
             "eta2" = 54.7953340215845,
             "Z2" =   34.66624553191,
             "Z3" = 3.27226847220648)
    expect_equal(summary2(e.lvm, bias.correct = FALSE)$coef$df,
                 as.double(df)) ## 
   
})

test_that("2 factor model with constrains: Satterthwaite + SSC (df)", {
    ## printDF(e.lvm, bias.correct = TRUE)
    df <- c("Y1~eta1" =               NA,
            "Y1~X2" = 68.0113221224538,
            "eta1~X2" = 66.6077972427716,
            "eta1~X1" =               NA,
            "Y2~eta1" = 11.2408944185087,
            "Y2~X2" = 77.7269315920684,
            "Y3~eta1" =               NA,
            "Z1~eta2" =               NA,
            "Z2~eta2" =               NA,
            "Z3~eta2" = 1.35704893019338,
            "Y1~~Y1" = 15.5089493754438,
            "eta1~~eta1" = 9.41781854032817,
            "Y2~~Y2" = 15.1899683888099,
            "Y3~~Y3" = 12.6199235511737,
            "Z1~~Z1" = 14.0484102543646,
            "eta2~~eta2" = 10.0631956693674,
            "Z2~~Z2" = 13.7710175900207,
            "Z3~~Z3" = 3.78212082916409,
            "Y1" =               NA,
            "eta1" = 50.7194725113502,
            "Y2" =  34.397316568393,
            "Y3" = 45.4582268189079,
            "Z1" =               NA,
            "eta2" = 53.6884108360234,
            "Z2" = 33.7172204457595,
            "Z3" = 3.20514896820429)
    expect_equal(summary2(e.lvm, bias.correct = TRUE)$coef$df,
                 as.double(df)) ## 
   
})

## * LVM: 2 factor model (covariance)
## ** model fit
m <- lvm(c(Y1~eta1,Y2~eta1,Y3~eta1+X1,
           Z1~eta2,Z2~eta2,Z3~eta2+X3))
covariance(m) <- eta1 ~ eta2
latent(m) <- ~eta1+eta2

e.lvm <- estimate(m,d)

## ** test df
test_that("2 factor model (covariance): Satterthwaite (df)", {
    ## printDF(e.lvm, bias.correct = FALSE)
    df <-  c("Y1~eta1" =               NA,
             "Y2~eta1" = 10.3311839234591,
             "Y3~eta1" = 6.89676162244621,
             "Y3~X1" = 50.0009118560904,
             "Z1~eta2" =               NA,
             "Z2~eta2" = 5.21780223264166,
             "Z3~eta2" = 1.28142409755873,
             "Z3~X3" = 50.0009118560906,
             "Y1~~Y1" = 11.8346316264266,
             "eta1~~eta1" = 12.7693197454533,
             "eta1~~eta2" = 5.12579807333608,
             "Y2~~Y2" = 13.6592519987499,
             "Y3~~Y3" = 13.0926110099904,
             "Z1~~Z1" = 11.3663608914827,
             "eta2~~eta2" = 7.04643330784406,
             "Z2~~Z2" =  12.226224178805,
             "Z3~~Z3" = 1.73380172595227,
             "Y1" =               NA,
             "eta1" =               50,
             "Y2" = 33.1988285063178,
             "Y3" = 23.9858199401525,
             "Z1" =               NA,
             "eta2" = 50.0000000000002,
             "Z2" = 13.1992959295212,
             "Z3" = 2.36363262783338)
    expect_equal(summary2(e.lvm, bias.correct = FALSE)$coef$df,
                 as.double(df)) ## 
   
})

test_that("2 factor model (covariance): Satterthwaite + SSC (df)", {
    ## printDF(e.lvm, bias.correct = TRUE)
    df <- c("Y1~eta1" =               NA,
            "Y2~eta1" = 9.58349979014013,
            "Y3~eta1" =  6.6486275006551,
            "Y3~X1" = 47.9891761341331,
            "Z1~eta2" =               NA,
            "Z2~eta2" = 4.43249430163883,
            "Z3~eta2" = 1.25054115806101,
            "Z3~X3" = 47.9905341990707,
            "Y1~~Y1" = 11.0158265784989,
            "eta1~~eta1" = 12.4789600763067,
            "eta1~~eta2" = 4.74482430527407,
            "Y2~~Y2" = 13.3536495981587,
            "Y3~~Y3" = 12.8019178207734,
            "Z1~~Z1" = 10.6708758416369,
            "eta2~~eta2" = 6.07189801632622,
            "Z2~~Z2" = 11.6954988957563,
            "Z3~~Z3" =  1.7905368531979,
            "Y1" =               NA,
            "eta1" = 48.6681581950846,
            "Y2" = 31.8998071401989,
            "Y3" = 22.9660180992877,
            "Z1" =               NA,
            "eta2" = 48.2861885270471,
            "Z2" =  11.886664758447,
            "Z3" = 2.17616519510875)
    expect_equal(summary2(e.lvm, bias.correct = TRUE)$coef$df,
                 as.double(df)) ## 
   
})

## * LVM: 2 factor model (correlation LV)
## ** model fit
m <- lvm(c(Y1~eta1,Y2~eta1,Y3~eta1+X1,
           Z1~eta2,Z2~eta2,Z3~eta2+X3))
regression(m) <- eta2 ~ X1
regression(m) <- eta1 ~ eta2+X2+X3

e.lvm <- estimate(m,d)
## ** test df
test_that("2 factor model with correlation: Satterthwaite (df)", {
    ## printDF(e.lvm, bias.correct = FALSE)
    df <- c("Y1~eta1" = NA,
            "eta1~eta2" = 7.589758,
            "eta1~X3" = 29.344241,
            "eta1~X2" = 28.544507,
            "Y2~eta1" = 10.329613,
            "Y3~eta1" = 6.948063,
            "Y3~X1" = 50.130493,
            "Z1~eta2" = NA,
            "eta2~X1" = 7.199988,
            "Z2~eta2" = 5.317187,
            "Z3~eta2" = 1.578974,
            "Z3~X3" = 51.112714,
            "Y1~~Y1" = 12.115728,
            "eta1~~eta1" = 11.798156,
            "Y2~~Y2" = 13.659673,
            "Y3~~Y3" = 13.247963,
            "Z1~~Z1" = 12.134005,
            "eta2~~eta2" = 7.073715,
            "Z2~~Z2" = 12.808074,
            "Z3~~Z3" = 2.357478,
            "Y1" = NA,
            "eta1" = 26.791170,
            "Y2" = 33.325329,
            "Y3" = 24.126234,
            "Z1" = NA,
            "eta2" = 50.252830,
            "Z2" = 13.570638,
            "Z3" = 3.000578)
    expect_equal(as.double(df),
                 suppressWarnings(summary2(e.lvm, bias.correct = FALSE)$coef$df)
                 )
})

test_that("2 factor model with correlation: Satterthwaite + SSC (df)", {
    ## printDF(e.lvm, bias.correct = TRUE)
    df <- c("Y1~eta1" =               NA,
            "eta1~eta2" = 6.92084347005809,
            "eta1~X3" = 28.7806435824005,
            "eta1~X2" = 28.0048020209966,
            "Y2~eta1" = 9.78669612407933,
            "Y3~eta1" = 6.95748573225155,
            "Y3~X1" = 47.3760723713175,
            "Z1~eta2" =               NA,
            "eta2~X1" = 6.51590190860975,
            "Z2~eta2" = 4.27555935788741,
            "Z3~eta2" = 1.54668374474335,
            "Z3~X3" = 48.0870623502859,
            "Y1~~Y1" = 11.5749134030209,
            "eta1~~eta1" = 11.5462469627778,
            "Y2~~Y2" = 13.2162556803891,
            "Y3~~Y3" = 13.0315399607834,
            "Z1~~Z1" = 11.0267345810053,
            "eta2~~eta2" = 6.02873123765679,
            "Z2~~Z2" = 12.1044846453221,
            "Z3~~Z3" = 2.57541058844509,
            "Y1" =               NA,
            "eta1" =  25.286034977098,
            "Y2" = 32.5523755802979,
            "Y3" = 23.8146546187347,
            "Z1" =               NA,
            "eta2" = 47.8752187652239,
            "Z2" = 11.9821151867928,
            "Z3" = 2.75496365860703)
    expect_equal(as.double(df),
                 summary2(e.lvm, bias.correct = TRUE)$coef$df)
})

######################################################################
### test1-sCorrect-summary2.R ends here
