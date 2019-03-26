library(PEMM)


### Name: PEMM_fun
### Title: A penalized EM algorithm incorporating missing-data mechanism
###   for multivariate parameter estimation
### Aliases: PEMM_fun
### Keywords: abundence-dependent missing-data mechanism a penalized EM
###   algorithm non-ignorable missing data

### ** Examples


set.seed(111)
library(PEMM)
data(sim_dat)
X.mar=sim_dat
X.mar[sample(1:length(X.mar),round(length(X.mar)*0.2))]<-NA

## If data are MAR or MCAR, by only specifying phi=0, 
## a penalized EM algorithm will be performed at default.
PEM.result = PEMM_fun(X.mar, phi=0) 

## By specifying phi=0, lambda=0, K=0, an EM algorithm will be performed. 
## Although when n is small, EM may not converge.
EM.result = PEMM_fun(X.mar, phi=0, lambda=0, K=0) 

## Generate data with non-ignorable missingness -- observations with 
## lower absolute values are more likely to be missing
phi=1
prob <- 0.5*exp(-phi*(sim_dat)^2)
X.mnar=sim_dat
X.mnar[which(rbinom(length(X.mnar),1,prob)==1)] <- NA
mean(is.na(X.mnar))  ## proportion of data being missing 

## Geting the estimated results
PEMM.result.mnar = PEMM_fun(X.mnar, phi=1) 
PEM.result.mnar = PEMM_fun(X.mnar, phi=0)  ## ignoring MNAR mechanism
EM.result.mnar = PEMM_fun(X.mnar, phi=0, lambda=0, K=0)  ## ignoring MNAR

## Compare the mean estimates for data with MNAR from different methods
## complete data
colMeans(sim_dat)

## EM results ignoring MNAR mechanism
EM.result.mnar$mu

## PEMM estimates
PEMM.result.mnar$mu

cor(colMeans(sim_dat),PEMM.result.mnar$mu)
cor(colMeans(sim_dat),EM.result.mnar$mu)




