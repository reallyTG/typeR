library(eda4treeR)


### Name: DataExam6.2
### Title: Data for Example 6.2 from Experimental Design & Analysis for
###   Tree Improvement
### Aliases: DataExam6.2 DataExam6.2
### Keywords: datasets

### ** Examples

data(DataExam6.2)

data(DataExam6.2)
library(tidyverse)
library(lme4)

print("Dbh Heritability for PNG")
DataExam6.2.1<- DataExam6.2[DataExam6.2$Province=="PNG",]
fm6.3 <- lm(formula      =
        Dbh.mean        ~ Replication+Family
        ,data           = DataExam6.2.1
       #, subset
       #, weights
       #, na.action
        , method      = "qr"
        , model       = TRUE
        , x           = FALSE
        , y           = FALSE
        , qr          = TRUE
        , singular.ok = TRUE
        , contrasts   = NULL
       )
b    <- anova(fm6.3)
print(b)
HM      <- function(x){length(x)/sum(1/x)}
w       <- HM(DataExam6.2.1$Dbh.count)
S2      <- b[["Mean Sq"]][length(b[["Mean Sq"]])]
Sigma2t <- mean(DataExam6.2.1$Dbh.variance)
sigma2m <- S2-(Sigma2t/w)
fm6.3.1<- lmer(formula=
     Dbh.mean ~ 1+Replication+(1|Family)
    ,data = DataExam6.2.1
    ,REML = TRUE
    ,control = lmerControl()
    ,start = NULL
    , verbose = 0L
   #, subset
   #, weights
   #, na.action
   #,offset
    , contrasts = NULL
    , devFunOnly = FALSE)
summary(fm6.3.1)
print(VarCorr(fm6.3.1),comp=c("Variance"))
sigma2f <- 0.2584
h2 <- (sigma2f/(0.3))/(Sigma2t+sigma2m+sigma2f)
cbind(w,Sigma2t,sigma2m,sigma2f,h2)

print("Dbh Heritability for all the Provinces")
fm6.4 <- lm(formula      =
        Dbh.mean        ~ Replication+Family
        ,data           = DataExam6.2
       #, subset
       #, weights
       #, na.action
        , method      = "qr"
        , model       = TRUE
        , x           = FALSE
        , y           = FALSE
        , qr          = TRUE
        , singular.ok = TRUE
        , contrasts   = NULL
       )
b    <- anova(fm6.4)
print(b)
HM      <- function(x){length(x)/sum(1/x)}
w       <- HM(DataExam6.2$Dbh.count)
S2      <- b[["Mean Sq"]][length(b[["Mean Sq"]])]
Sigma2t <- mean(DataExam6.2$Dbh.variance)
sigma2m <- S2-(Sigma2t/w)
fm6.4.1<- lmer(formula=
     Dbh.mean ~ 1+Replication+Province+(1|Family)
    ,data = DataExam6.2
    ,REML = TRUE
    ,control = lmerControl()
    ,start = NULL
    , verbose = 0L
   #, subset
   #, weights
   #, na.action
   #,offset
    , contrasts = NULL
    , devFunOnly = FALSE)
summary(fm6.4.1)
print(VarCorr(fm6.4.1),comp=c("Variance"))
sigma2f <- 0.3514
h2 <- (sigma2f/(0.3))/(Sigma2t+sigma2m+sigma2f)
cbind(w,Sigma2t,sigma2m,sigma2f,h2)
print("Genetic Correlation Between Dbh and Height for PNG Province")
fm6.7.1<- lmer(formula=
     Dbh.mean ~ 1+Replication+(1|Family)
    ,data = DataExam6.2.1
    ,REML = TRUE
    ,control = lmerControl()
    ,start = NULL
    , verbose = 0L
   #, subset
   #, weights
   #, na.action
   #,offset
    , contrasts = NULL
    , devFunOnly = FALSE)
summary(fm6.7.1)
print(VarCorr(fm6.7.1),comp=c("Variance"))
sigma2f[1] <- 0.2584

fm6.7.2<- lmer(formula=
     Ht.mean ~ 1+Replication+(1|Family)
    ,data = DataExam6.2.1
    ,REML = TRUE
    ,control = lmerControl()
    ,start = NULL
    , verbose = 0L
   #, subset
   #, weights
   #, na.action
   #,offset
    , contrasts = NULL
    , devFunOnly = FALSE)
summary(fm6.7.2)
print(VarCorr(fm6.7.2),comp=c("Variance"))
sigma2f[2] <- 0.2711

fm6.7.3<- lmer(formula=
     Sum.means ~ 1+Replication+(1|Family)
    ,data = DataExam6.2.1
    ,REML = TRUE
    ,control = lmerControl()
    ,start = NULL
    , verbose = 0L
   #, subset
   #, weights
   #, na.action
   #,offset
    , contrasts = NULL
    , devFunOnly = FALSE)
summary(fm6.7.3)
print(VarCorr(fm6.7.3),comp=c("Variance"))
sigma2f[3] <- 0.873
sigma2xy    <- 0.5*(sigma2f[3]-sigma2f[1]-sigma2f[2])
GenCorr <- sigma2xy/sqrt(sigma2f[1]*sigma2f[2])
cbind(S2x=sigma2f[1],S2y=sigma2f[2],S2.x.plus.y=sigma2f[3],GenCorr)



