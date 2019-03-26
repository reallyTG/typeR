library(AdvBinomApps)


### Name: ci.mult.ref.cm
### Title: Upper Clopper-Pearson confidence limits for area scaling with
###   differently sized reference products and countermeasures
### Aliases: ci.mult.ref.cm
### Keywords: area scaling countermeasures

### ** Examples

#Reference product 1: 1 failure - failure tackled with 80% efficiency.
#Reference product 2: 2 failures - 1 failure tackled with 80%, 
#1 failure with 60% efficiency.
k<-c(1,2)
K<-matrix(c(1,0,1,1),2,2,byrow=TRUE)
n<-c(110000,138000)
theta<-c(0.8,0.6)
A.ref<-c(5.21,10.71)
A.follow<-8.5
p.target<-20e-06
ci.mult.ref.cm(k,n,A.ref,A.follow,K,theta,p.target=p.target)

#Reference product 1: 1 failure - failure tackled with 20% efficiency.
#Reference product 2: 2 failures - 1 failure tackled with 20%, 
#1 failure with 40% efficiency.
#Reference product 3: 2 failures - both tackled with 60% efficiency.
k<-c(1,2,2)
n<-c(110000,138000,170000)
K<-matrix(c(1,0,0,1,1,0,0,0,2),3,3,byrow=TRUE)
theta<-c(0.2,0.4,0.6)
A.ref<-c(5.21,10.71,7.89)
A.follow<-8.5
p.target<-20e-06
ci.mult.ref.cm(k,n,A.ref,A.follow,K,theta,p.target=p.target)

#Reference product 1: 1 failure - failure tackled with 20% efficiency.
#Reference product 2: 2 failures - 1 failure tackled with 40% efficiency, 
#1 failure without countermeasure.
#Reference product 3: 3 failures - 1 failure tackled with 60% efficiency, 
#2 failures without countermeasures.
k<-c(1,2,3)
n<-c(110000,138000,170000)
K<-matrix(c(1,0,0,0,1,0,0,0,1),3,3,byrow=TRUE)
theta<-c(0.2,0.4,0.6)
A.ref<-c(5.21,10.71,7.89)
A.follow<-8.5
p.target<-20e-06
ci.mult.ref.cm(k,n,A.ref,A.follow,K,theta,p.target=p.target)




