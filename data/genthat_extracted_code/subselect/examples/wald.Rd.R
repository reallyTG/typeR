library(subselect)


### Name: wald.coef
### Title: Wald statistic for variable selection in generalized linear
###   models
### Aliases: wald.coef
### Keywords: manip

### ** Examples


## ---------------------------------------------------------------


##  An example of variable selection in the context of binary response
##  regression models. The logarithms and original physical measurements
##  of the "Leptograpsus variegatus crabs" considered in the MASS crabs 
##  data set are used to fit a logistic model that takes the sex of each crab
##  as the response variable.

library(MASS)
data(crabs)
lFL <- log(crabs$FL)
lRW <- log(crabs$RW)
lCL <- log(crabs$CL)
lCW <- log(crabs$CW)
logrfit <- glm(sex ~ FL + RW + CL + CW  + lFL + lRW + lCL + lCW,
crabs,family=binomial) 
## Warning message:
## fitted probabilities numerically 0 or 1 occurred in: glm.fit(x = X, y = Y, 
## weights = weights, start = start, etastart = etastart, 

lHmat <- glmHmat(logrfit) 
wald.coef(lHmat$mat,lHmat$H,c(1,6,7),tolsym=1E-06)
## [1] 2.286739
## Warning message:

## The covariance/total matrix supplied was slightly asymmetric: 
## symmetric entries differed by up to 6.57252030578093e-14.
## (less than the 'tolsym' parameter).
## It has been replaced by its symmetric part.
## in: validmat(mat, p, tolval, tolsym)


## ---------------------------------------------------------------

## 2) An example computing the value of the Wald statistic in a logistic 
##  model for five subsets produced when a probit model was originally 
##  considered

library(MASS)
data(crabs)
lFL <- log(crabs$FL)
lRW <- log(crabs$RW)
lCL <- log(crabs$CL)
lCW <- log(crabs$CW)
probfit <- glm(sex ~ FL + RW + CL + CW  + lFL + lRW + lCL + lCW,
crabs,family=binomial(link=probit)) 
## Warning message:
## fitted probabilities numerically 0 or 1 occurred in: glm.fit(x = X, y = Y, 
## weights = weights, start = start, etastart = etastart) 

pHmat <- glmHmat(probfit) 
probresults <-eleaps(pHmat$mat,kmin=3,kmax=3,nsol=5,criterion="Wald",H=pHmat$H,
r=1,tolsym=1E-10)
## Warning message:

## The covariance/total matrix supplied was slightly asymmetric: 
## symmetric entries differed by up to 3.14059889205964e-12.
## (less than the 'tolsym' parameter).
## It has been replaced by its symmetric part.
## in: validmat(mat, p, tolval, tolsym) 

logrfit <- glm(sex ~ FL + RW + CL + CW  + lFL + lRW + lCL + lCW,
crabs,family=binomial) 
## Warning message:
## fitted probabilities numerically 0 or 1 occurred in: glm.fit(x = X, y = Y, 
## weights = weights, start = start, etastart = etastart)

lHmat <- glmHmat(logrfit) 
wald.coef(lHmat$mat,H=lHmat$H,probresults$subsets,tolsym=1e-06)
##             Card.3
## Solution 1 2.286739
## Solution 2 2.595165
## Solution 3 2.585149
## Solution 4 2.669059
## Solution 5 2.690954
## Warning message:

## The covariance/total matrix supplied was slightly asymmetric: 
## symmetric entries differed by up to 6.57252030578093e-14.
## (less than the 'tolsym' parameter).
## It has been replaced by its symmetric part.
## in: validmat(mat, p, tolval, tolsym)




