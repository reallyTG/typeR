## ----noname,echo=FALSE---------------------------------------------------
#opts_chunk$set(comment=NA,background='white')

## ----dataexplore---------------------------------------------------------
library(glmm)
data(salamander)
names(salamander)
head(salamander)
summary(salamander)

## ----themodel,cache=TRUE-------------------------------------------------
set.seed(1234) 
clust <- makeCluster(2)
sal <- glmm(Mate ~ 0 + Cross, random = list(~ 0 + Female, 
~ 0 + Male), varcomps.names = c("F", "M"), data = salamander, 
family.glmm = bernoulli.glmm, m = 10^4, debug = TRUE, cluster = clust)
stopCluster(clust)

## ----summary-------------------------------------------------------------
summary(sal)

## ----coefall-------------------------------------------------------------
coef(sal)
coefficients(sal)

## ----vars----------------------------------------------------------------
varcomps(sal)

## ----extractsome---------------------------------------------------------
coef(sal)[c(3,4)]
varcomps(sal)[1]

## ----confintall----------------------------------------------------------
confint(sal)

## ----confintLevels-------------------------------------------------------
confint(sal,level=.9)
confint(sal,level=.99)

## ----confintFixed--------------------------------------------------------
confint(sal,level=.9,c(1,3))
confint(sal,level=.9,c("CrossR/R","CrossW/R"))

## ----confintFem----------------------------------------------------------
confint(sal,level=.93,c(5))
confint(sal,level=.93,c("F"))

## ----getmcse-------------------------------------------------------------
mcse(sal)

## ----comparese-----------------------------------------------------------
se(sal)

## ----getvcov-------------------------------------------------------------
(myvcov <- vcov(sal))

## ----denomVar------------------------------------------------------------
myvar <- myvcov[1,1] + myvcov[4,4] - 2* myvcov[1,4]
SE <- sqrt(myvar)

## ----pval----------------------------------------------------------------
test.stat <- (coef(sal)[1] - coef(sal)[4]) / SE
as.numeric(2 * pnorm(test.stat))

## ----morestuff-----------------------------------------------------------
names(sal)

## ----othermodel,eval=FALSE-----------------------------------------------
#  sal <- glmm(Mate ~ 0 + Cross, random = list(~ 0 + Female,
#  ~ 0 + Male), varcomps.equal = c( 1, 1), varcomps.names =
#  c("Only Varcomp"), data = salamander, family.glmm =
#  bernoulli.glmm, m = 10^4, debug = TRUE, cluster = clust)

