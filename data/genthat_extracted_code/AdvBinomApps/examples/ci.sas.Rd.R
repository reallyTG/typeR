library(AdvBinomApps)


### Name: ci.sas
### Title: Separate area scaling for upper Clopper-Pearson confidence
###   limits
### Aliases: ci.sas
### Keywords: separate area scaling

### ** Examples

k<-c(1,0)
n<-100000
A.ref<-c(1,1.5)
A.follow<-c(1,2)
p.target<-20e-06
ci.sas(k,n,A.ref,A.follow,0.1,p.target)

k<-c(2,1,0)
n<-100000
A.ref<-c(2,3,4)
A.follow<-c(1,2,3)
p.target<-20e-06
ci.sas(k,n,A.ref,A.follow,0.1,p.target)

k<-c(1,1,0,2)
n<-100000
A.ref<-c(1,1,1,1)
A.follow<-c(3,4,5,6)
p.target<-20e-06
ci.sas(k,n,A.ref,A.follow,0.1,p.target)



