library(AdvBinomApps)


### Name: ci.syn.cm
### Title: Upper Clopper-Pearson confidence limits under chip synergies and
###   countermeasures
### Aliases: ci.syn.cm
### Keywords: chip synergies countermeasures

### ** Examples

#Subset 1: no failures.
#Subset 2: 1 failure - failure tackled with 80% efficiency.
k<-c(0,1)
K<-matrix(c(0,1),2,1,byrow=TRUE)
theta<-0.8
n<-c(110000,330000)
ci.syn.cm(k,n,K,theta,0.1,20e-06)

#Subset 1: 1 failure - failure tackled with 80% efficiency.
#Subset 2: 1 failure - failure tackled with 70% efficiency.
#Subset 3: 2 failures - 1 failure tackled with 80%, 
#1 failure with 70% efficiency.
k<-c(1,1,2)
K<-matrix(c(1,0,0,1,1,1),3,2,byrow=TRUE)
theta<-c(0.8,0.7)
n<-c(110000,150000,220000)
ci.syn.cm(k,n,K,theta,0.1,20e-06)

#Subset 1: 1 failure - failure tackled with 80% efficiency.
#Subset 2: 1 failure - failure without countermeasure.
#Subset 3: 2 failures - 1 failure tackled with 70% efficiency, 
#1 failure without countermeasure.
k<-c(1,1,2)
K<-matrix(c(1,0,0,0,0,1),3,2,byrow=TRUE)
theta<-c(0.8,0.7)
n<-c(110000,150000,220000)
ci.syn.cm(k,n,K,theta,0.1,20e-06)




