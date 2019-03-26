library(covLCA)


### Name: covLCA
### Title: Latent Class Models with Covariate Effects on Underlying and
###   Measured Variables
### Aliases: covLCA
### Keywords: methods

### ** Examples

## 2 models for a subset of dataset election in package poLCA
library("poLCA")
data("election",package="poLCA")
election$GENDER <- factor(election$GENDER)
elec <- election[,c(1:3,7:12,16:17)]
elec <- na.omit(elec)
elec <- elec[1:200,]
## Model 1: 3 classes, 1 covariate for modelling latent class membership
fm1 <- cbind(MORALG,CARESG,KNOWG,MORALB,CARESB,
KNOWB)~PARTY
poLCA1 <- poLCA(formula=fm1,data=elec,nclass=3,nrep=10)

## Model 2: 3 classes, 1 covariate in the model for latent class membership,
## 1 covariate in the model for the manifest variables probabilities
fm2 <- cbind(MORALG,CARESG,KNOWG,MORALB,CARESB,
KNOWB)~1+PARTY
fm3 <- cbind(MORALG,CARESG,KNOWG,MORALB,CARESB,
KNOWB)~1+GENDER

covLCA1 <- covLCA(formula1=fm2,formula2=fm3,data=elec,nclass=3,
beta.auto=TRUE,gamma.auto=TRUE,alpha.auto=TRUE,maxit=10000)

## Not run: 
##D ## 2 models for dataset election in package poLCA
##D library("poLCA")
##D data("election",package="poLCA")
##D election$GENDER <- factor(election$GENDER)
##D elec <- election[,c(1:12,16:17)]
##D elec <- na.omit(elec)
##D 
##D ## Model 1: 3 classes, 1 covariate for modelling latent class membership
##D fm1 <- cbind(MORALG,CARESG,KNOWG,LEADG,DISHONG,INTELG,MORALB,CARESB,
##D KNOWB,LEADB,DISHONB,INTELB)~PARTY
##D poLCA1 <- poLCA(formula=fm1,data=elec,nclass=3,nrep=10)
##D 
##D ## Model 2: 3 classes, 1 covariate in the model for latent class membership,
##D ## 1 covariate in the model for the manifest variables probabilities
##D fm2 <- cbind(MORALG,CARESG,KNOWG,LEADG,DISHONG,INTELG,MORALB,CARESB,
##D KNOWB,LEADB,DISHONB,INTELB)~1+PARTY
##D fm3 <- cbind(MORALG,CARESG,KNOWG,LEADG,DISHONG,INTELG,MORALB,CARESB,
##D KNOWB,LEADB,DISHONB,INTELB)~1+GENDER
##D 
##D covLCA1 <- covLCA(formula1=fm2,formula2=fm3,data=elec,nclass=3,
##D beta.auto=TRUE,gamma.auto=TRUE,alpha.auto=TRUE,maxit=10000)
## End(Not run)



