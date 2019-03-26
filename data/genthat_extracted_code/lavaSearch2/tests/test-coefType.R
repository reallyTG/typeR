### test-coefType.R --- 
#----------------------------------------------------------------------
## author: Brice Ozenne
## created: okt 12 2017 (14:52) 
## Version: 
## last-updated: aug  6 2018 (15:34) 
##           By: Brice Ozenne
##     Update #: 79
#----------------------------------------------------------------------
## 
### Commentary: 
## 
### Change Log:
#----------------------------------------------------------------------
## 
### Code:

## * header
rm(list = ls())
if(TRUE){ ## already called in test-all.R
    library(testthat)
    library(lavaSearch2)
}

lava.options(symbols = c("~","~~"))

context("coefType")

## * linear regression
## ** only continous variables
m <- lvm(Y~X1+X2)
e <- estimate(m, lava::sim(m, 1e2))


df.truth <- data.frame(name = c("Y","Y~X1","Y~X2","Y~~Y"),
                       type = c("intercept","regression","regression","variance"),
                       letter = c("nu","K","K","Sigma_var"),
                       stringsAsFactors = FALSE)

test_that("coefType - lm", {

    test <- coefType(m, as.lava = TRUE)
    GS <- setNames(df.truth$type,df.truth$name)
    expect_equal(test,GS)

    test <- subset(coefType(m, as.lava = FALSE), !is.na(lava))
    expect_equal(test$detail,df.truth$letter)
    expect_equal(test$name,df.truth$name)

    test <- coefType(e, as.lava = TRUE)
    GS <- setNames(df.truth$type,df.truth$name)[names(test)]
    expect_equal(test,GS)

    test <- subset(coefType(e, as.lava = FALSE), !is.na(lava))
    expect_equal(test$detail,df.truth$letter)
    expect_equal(test$name,df.truth$name)

})

test_that("coefCov - lm", {
    expect_true(is.null(coefCov(m)))
    expect_true(is.null(coefCov(m, value = TRUE)))

    expect_equal(coefCov(m, keep.var = TRUE),4)
    expect_equal(coefCov(m, value = TRUE, keep.var = TRUE),"Y~~Y")
})

test_that("coefIndexModel - lm", {
    expect_true(all(coefIndexModel(m)==1))
    expect_true(all(coefIndexModel(e)==1))
})

test_that("coefIntercept - lm", {
    expect_equal(coefIntercept(m, keep.var = TRUE),1)
    expect_equal(coefIntercept(m, value = TRUE, keep.var = TRUE),"Y")
}) 

test_that("coefReg - lm", {
    expect_equal(coefReg(m, keep.var = TRUE),2:3)
    expect_equal(coefReg(m, value = TRUE, keep.var = TRUE),c("Y~X1","Y~X2"))
}) 

## ** 1 categorical variable
m <- lvm(Y~X1+X2+X3)
mSim <- m
categorical(mSim, labels =c("a","b","c")) <- ~X2
d <- lava::sim(mSim, 1e2)
e <- estimate(m, d)

df.truth <- data.frame(name = c("Y","Y~X1","Y~X2b","Y~X2c","Y~X3","Y~~Y"),
                       type = c("intercept","regression","regression","regression","regression","variance"),
                       letter = c("nu","K","K","K","K","Sigma_var"),
                       stringsAsFactors = FALSE
                       )

test_that("coefType - lm", {
    
    test <- coefType(mSim, as.lava = TRUE)
    expect_equal(names(test),as.character(coef(mSim)))

    test <- coefType(e, as.lava = TRUE)
    GS <- setNames(df.truth$type,df.truth$name)[names(coef(e))]
    expect_equal(test,GS)
    
    test <- subset(coefType(e, as.lava = FALSE), !is.na(lava))
    expect_equal(test$detail,df.truth$letter)
    expect_equal(test$name,df.truth$name)
})

## ** Several categorical variables
m <- lvm(Y1~X1+X2,Y2~X1+X3)
mSim <- m
categorical(mSim, labels = c("a","b","c")) <- "X1"
d <- lava::sim(mSim, 1e2)
e <- estimate(m, d)

df.truth <- data.frame(name = c("Y1","Y2",
                                "Y1~X1b","Y1~X1c","Y1~X2",
                                "Y2~X1b","Y2~X1c","Y2~X3",
                                "Y1~~Y1","Y2~~Y2"),
                       stringsAsFactors = FALSE)
df.truth$type <- c(rep("intercept",2),rep("regression",6),rep("variance",2))
df.truth$letter <- c(rep("nu",2),rep("K",6),rep("Sigma_var",2))

test_that("coefType - lm", {

    test <- coefType(mSim, as.lava = TRUE)
    expect_equal(names(test),as.character(coef(mSim)))

    test <- coefType(e, as.lava = TRUE)
    GS <- setNames(df.truth$type,df.truth$name)[names(coef(e))]
    expect_equal(test,GS)
    
    test <- subset(coefType(e, as.lava = FALSE), !is.na(lava))
    expect_equal(test$detail,df.truth$letter)
    expect_equal(test$name,df.truth$name)
})

## ** with extra variable

m.sim <- lvm(Y1 ~ 1)
categorical(m.sim, labels = c("control","concussion")) <- ~group

test_that("coefType - lm with extra variable", {
    coefType(m.sim)
})

## m.sim <- lvm(Y1 ~ 1, group ~ 1) ## ERROR
## categorical(m.sim, labels = c("control","concussion")) <- ~group
## lava:::categorical2dummy(m.sim, sim(m.sim, 1e2))$x$M
## no group concussion column

## * lvm
## ** categorical variable
m <- lvm(c(Y1,Y2,Y3)~eta1, c(Z1,Z2,Z3)~eta2)
regression(m) <- Y1~X1
regression(m) <- eta2~eta1+X2
covariance(m) <- Y1~Z1
latent(m) <- ~eta1+eta2
mSim <- m
categorical(mSim, labels =c("a","b","c")) <- ~X2
d <- lava::sim(mSim, 1e2, latent = FALSE)
e <- estimate(m, d)

df.truth <- rbind(c("Y2","intercept","nu"),
                  c("Y3","intercept","nu"),
                  c("Z2","intercept","nu"),
                  c("Z3","intercept","nu"),
                  ##
                  c("eta1","intercept","alpha"),
                  c("eta2","intercept","alpha"),
                  ##
                  c("Y1~X1","regression","K"),
                  ##
                  c("Y2~eta1","regression","Lambda"),
                  c("Y3~eta1","regression","Lambda"),
                  c("Z2~eta2","regression","Lambda"),
                  c("Z3~eta2","regression","Lambda"),
                  ##
                  c("eta2~eta1","regression","B"),
                  ##
                  c("eta2~X2b","regression","Gamma"),
                  c("eta2~X2c","regression","Gamma"),
                  ##
                  c("Y1~~Y1","variance","Sigma_var"),
                  c("Y2~~Y2","variance","Sigma_var"),
                  c("Y3~~Y3","variance","Sigma_var"),
                  c("Z1~~Z1","variance","Sigma_var"),
                  c("Z2~~Z2","variance","Sigma_var"),
                  c("Z3~~Z3","variance","Sigma_var"),
                  ##
                  c("eta1~~eta1","variance","Psi_var"),
                  c("eta2~~eta2","variance","Psi_var"),
                  ##
                  c("Y1~~Z1","covariance","Sigma_cov")
                  )

df.truth <- as.data.frame(df.truth, stringsAsFactors = FALSE)
names(df.truth) <- c("name","type","detail")
df.truth <- df.truth[order(df.truth$type,df.truth$detail,df.truth$name),]

test_that("coefType - lvm", {

    test <- coefType(mSim, as.lava = TRUE)
    expect_equal(names(test),as.character(coef(mSim)))
    
    test <- coefType(e, as.lava = TRUE)
    GS <- setNames(df.truth$type,df.truth$name)[names(coef(e))]
    expect_equal(test,GS)

    test <- subset(coefType(e, as.lava = FALSE), !is.na(lava))
    expect_equal(test$detail,df.truth$detail)
    expect_equal(test$name,df.truth$name)
})
## ** constrains (0 mean 1 loading)

m <- lvm(c(Y1~0+1*eta1,Y2~0+1*eta1,Y3~0+1*eta1,
           Z1~0+1*eta2,Z2~0+1*eta2,Z3~0+1*eta2))
latent(m) <- ~eta1 + eta2
covariance(m) <- Y1~Y2

e <- estimate(m, lava::sim(m,1e2))


df.truth <- rbind(data.frame(name = "Y1", type = "intercept", detail = "nu", fixed = TRUE, stringsAsFactors = FALSE),
                  data.frame(name = "Y2", type = "intercept", detail = "nu", fixed = TRUE, stringsAsFactors = FALSE),
                  data.frame(name = "Y3", type = "intercept", detail = "nu", fixed = TRUE, stringsAsFactors = FALSE),
                  data.frame(name = "Z1", type = "intercept", detail = "nu", fixed = TRUE, stringsAsFactors = FALSE),
                  data.frame(name = "Z2", type = "intercept", detail = "nu", fixed = TRUE, stringsAsFactors = FALSE),
                  data.frame(name = "Z3", type = "intercept", detail = "nu", fixed = TRUE, stringsAsFactors = FALSE),
                  ##
                  data.frame(name = "eta1", type = "intercept", detail = "alpha", fixed = FALSE, stringsAsFactors = FALSE),
                  data.frame(name = "eta2", type = "intercept", detail = "alpha", fixed = FALSE, stringsAsFactors = FALSE),
                  ##
                  data.frame(name = "Y1~eta1", type = "regression", detail = "Lambda", fixed = TRUE, stringsAsFactors = FALSE),
                  data.frame(name = "Y2~eta1", type = "regression", detail = "Lambda", fixed = TRUE, stringsAsFactors = FALSE),
                  data.frame(name = "Y3~eta1", type = "regression", detail = "Lambda", fixed = TRUE, stringsAsFactors = FALSE),
                  data.frame(name = "Z1~eta2", type = "regression", detail = "Lambda", fixed = TRUE, stringsAsFactors = FALSE),
                  data.frame(name = "Z2~eta2", type = "regression", detail = "Lambda", fixed = TRUE, stringsAsFactors = FALSE),
                  data.frame(name = "Z3~eta2", type = "regression", detail = "Lambda", fixed = TRUE, stringsAsFactors = FALSE),
                  ##
                  data.frame(name = "Y1~~Y1", type = "variance", detail = "Sigma_var", fixed = FALSE, stringsAsFactors = FALSE),
                  data.frame(name = "Y2~~Y2", type = "variance", detail = "Sigma_var", fixed = FALSE, stringsAsFactors = FALSE),
                  data.frame(name = "Y3~~Y3", type = "variance", detail = "Sigma_var", fixed = FALSE, stringsAsFactors = FALSE),
                  data.frame(name = "Z1~~Z1", type = "variance", detail = "Sigma_var", fixed = FALSE, stringsAsFactors = FALSE),
                  data.frame(name = "Z2~~Z2", type = "variance", detail = "Sigma_var", fixed = FALSE, stringsAsFactors = FALSE),
                  data.frame(name = "Z3~~Z3", type = "variance", detail = "Sigma_var", fixed = FALSE, stringsAsFactors = FALSE),
                  ##
                  data.frame(name = "eta1~~eta1", type = "variance", detail = "Psi_var", fixed = FALSE, stringsAsFactors = FALSE),
                  data.frame(name = "eta2~~eta2", type = "variance", detail = "Psi_var", fixed = FALSE, stringsAsFactors = FALSE),
                  ##
                  data.frame(name = "Y1~~Y2", type = "covariance", detail = "Sigma_cov", fixed = FALSE, stringsAsFactors = FALSE)
                  )
df.truth <- as.data.frame(df.truth)
df.truth <- df.truth[order(df.truth$type,df.truth$detail,df.truth$name),]

test_that("coefType - constrains 0/1", {

    test <- coefType(m, as.lava = TRUE)
    expect_equal(names(test),as.character(coef(m)))

    test <- coefType(e, as.lava = TRUE)
    GS <- setNames(df.truth[df.truth$fixed==FALSE,"type"],df.truth[df.truth$fixed==FALSE,"name"])[names(coef(e))]
    expect_equal(test,GS)
    
    test <- coefType(e, as.lava = FALSE)
    expect_equal(test$detail,df.truth$detail)
    expect_equal(test$name,df.truth$name)    
})


## ** constrains (common mean and variance)

m <- lvm(c(Y1[mu:sigma]~beta*eta1,Y2[mu:sigma]~1*eta1,Y3~1*eta1+X1),eta1~X1)
mSim <- m
categorical(mSim, labels = as.character(1:3)) <- ~X1

d <- lava::sim(mSim, latent=FALSE, 1e2)
e <- estimate(m, d)

test_that("coefType - constrains mean/variance", {
    test <- coefType(m, as.lava = TRUE)
    expect_equal(names(test),as.character(coef(m)))

    test <- coefType(e, as.lava = TRUE)
    #GS <- setNames(df.truth[fixed==FALSE,type],df.truth[fixed==FALSE,name])[names(coef(e))]
    #expect_equal(test,GS)
 
    coefType(e, as.lava = FALSE)
})

 
#----------------------------------------------------------------------
### test-coefType.R ends here

