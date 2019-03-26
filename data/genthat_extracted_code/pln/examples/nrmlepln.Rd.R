library(pln)


### Name: nrmlepln
### Title: Full information maximum likelihood and bivariate composite
###   likelihood estimation for polytomous logit-normit (graded logistic)
###   model
### Aliases: nrmlepln nrmlerasch nrbcpln
### Keywords: models

### ** Examples


### Matrix of response patterns and frequencies
data(item5fr)

## ML estimation
nrmleplnout<-nrmlepln(item5fr, ncat=3, nitem=5)
print(nrmleplnout)

## BCL estimation
nrbcplnout<-nrbcpln(item5fr, ncat=3, nitem=5)
print(nrbcplnout)

## ML Rasch estimation
nrmleraschout<-nrmlerasch(item5fr, ncat=3, nitem=5)
print(nrmleraschout)

## Not run: 
##D ### Raw data
##D data(item9cat5)
##D 
##D ## ML estimation
##D nrmleplnout<-nrmlepln(item9cat5, ncat=5)
##D print(nrmleplnout)
##D 
##D ## BCL estimation
##D nrbcplnout<-nrbcpln(item9cat5, ncat=5, se=FALSE)
##D print(nrbcplnout)
##D 
##D ## ML Rasch estimation
##D nrmleraschout<-nrmlerasch(item9cat5, ncat=5)
##D print(nrmleraschout)
## End(Not run)




