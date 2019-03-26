library(pln)


### Name: simulpln
### Title: Simulate data from polytomous logit-normit (graded logistic)
###   model
### Aliases: simulpln
### Keywords: models

### ** Examples


n<-500;
ncat<-3;
nitem<-5
alphas=c(0,-.5,  .2,-1,  .4,-.6,  .3,-.2,  .5,-.5)
betas=c(1,1,1,.5,.5)

set.seed(1234567)
datfr<-simulpln(n,nitem,ncat,alphas,betas)
nrmleplnout<-nrmlepln(datfr, ncat=ncat, nitem=nitem)
nrmleplnout




