library(BeyondBenford)


### Name: BeyondBenford-package
### Title: Compare the goodness of fit of Benford's and Blondeau Da Silva's
###   digit distributions to a given dataset
### Aliases: BeyondBenford-package BeyondBenford

### ** Examples

data(address_PierreBuffiere)
data(census)
data(address_AixesurVienne)

dat.distr(address_PierreBuffiere,nchi=6)
dat.distr(census,theor=0,nclass=100,dig=3)
dat.distr(address_AixesurVienne,upbound=75)

digit.distr(address_AixesurVienne,mod="ben&blo",upbound=75)
digit.distr(address_PierreBuffiere,mod="blo",dig=2)

chi2(address_PierreBuffiere,dig=2,pval=1)
chi2(address_PierreBuffiere,dig=2,pval=1,mod="blo")




