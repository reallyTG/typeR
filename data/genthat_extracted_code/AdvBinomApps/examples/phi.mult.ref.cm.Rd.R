library(AdvBinomApps)


### Name: phi.mult.ref.cm
### Title: Downscaling of failures tackled by countermeasures to greatest
###   common chip size
### Aliases: phi.mult.ref.cm
### Keywords: area scaling countermeasures

### ** Examples

k<-c(1,2)
n<-c(10,10)
K<-matrix(c(1,0,1,1),2,2,byrow=TRUE)
theta<-c(0.7,0.8)
A.ref<-c(1,2)
phi.mult.ref.cm(k,n,A.ref,K,theta)

k<-c(1,2)
n<-c(110000,220000)
K<-matrix(c(1,0,0,1),2,2,byrow=TRUE) #no CM for one fail!
theta<-c(0.7,0.8)
A.ref<-c(2,3)
phi.mult.ref.cm(k,n,A.ref,K,theta)



