library(AdvBinomApps)


### Name: AdvBinomApps-package
### Title: Upper Clopper-Pearson Confidence Limits For Burn-in Studies
###   under Additional Available Information
### Aliases: AdvBinomApps-package AdvBinomApps

### ** Examples

#MULTIPLE REFERENCE PRODUCTS:
k<-c(1,2)
n<-c(110000,138000)
A.ref<-c(5.21,10.71)
A.follow<-8.5
p.target<-20e-06
ci.mult.ref(k,n,A.ref,A.follow,p.target=p.target)

#SYNERGIES
k<-c(0,1)
n<-c(110000,330000)
ci.syn(k,n,0.1,20e-06)

#SEPARATE AREA SCALING
k<-c(1,0)
n<-110000
A.ref<-c(1,1.5)
A.follow<-c(1,2)
p.target<-20e-06
ci.sas(k,n,A.ref,A.follow,0.1,p.target)



