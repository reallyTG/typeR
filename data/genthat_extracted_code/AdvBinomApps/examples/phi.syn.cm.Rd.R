library(AdvBinomApps)


### Name: phi.syn.cm
### Title: Assembling of devices with countermeasures
### Aliases: phi.syn.cm
### Keywords: chip synergies countermeasures

### ** Examples

k<-c(0,1)
K<-matrix(c(0,1),2,1,byrow=TRUE)
theta<-0.8
n<-c(110000,330000)
phi.syn.cm(k,n,K,theta)

k<-c(1,1,2)
K<-matrix(c(0,0,0,1,1,1),3,2,byrow=TRUE)
theta<-c(0.7,0.5)
n<-c(10,15,20)
phi.syn.cm(k,n,K,theta)




