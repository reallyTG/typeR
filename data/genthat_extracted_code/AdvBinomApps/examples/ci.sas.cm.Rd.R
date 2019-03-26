library(AdvBinomApps)


### Name: ci.sas.cm
### Title: Separate area scaling for upper Clopper-Pearson confidence
###   limits with countermeasures
### Aliases: ci.sas.cm
### Keywords: separate area scaling countermeasures

### ** Examples

#Reference product: 1 failure.
#Subset 1: 1 failure - failure tackled with 80% efficiency.
#Subset 2: no failures.
k<-c(1,0)
K<-matrix(c(1,0),2,1)
n<-100000
A.ref<-c(1,1)
theta<-0.8
A.follow<-c(1,2)
p.target<-20e-06
ci.sas.cm(k,n,A.ref,A.follow,K,theta,0.1,p.target)

#Reference product: 3 failures.
#Subset 1: 2 failures - 1 failure tackled with 80%, 
#1 failure with 70% efficiency.
#Subset 2: 1 failure - failure tackled with 70% efficiency.
#Subset 3: no failures.
k<-c(2,1,0)
K<-matrix(c(1,1,0,1,0,0),3,2,byrow=TRUE)
n<-100000
A.ref<-c(2,3,4)
theta<-c(0.8,0.7)
A.follow<-c(1,2,3)
p.target<-20e-06
ci.sas.cm(k,n,A.ref,A.follow,K,theta,0.1,p.target)

#Reference product: 4 failures.
#Subset 1: 2 failures - 1 failure tackled with 80% efficiency, 
#1 failure without countermeasure.
#Subset 2: 1 failure - failure tackled with 70% efficiency.
#Subset 3: 1 failure - failure without countermeasure.
k<-c(2,1,1)
K<-matrix(c(1,0,0,1,0,0),3,2,byrow=TRUE)
n<-100000
A.ref<-c(2,3,4)
theta<-c(0.8,0.7)
A.follow<-c(1,2,3)
p.target<-20e-06
ci.sas.cm(k,n,A.ref,A.follow,K,theta,0.1,p.target)




