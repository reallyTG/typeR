library(weightedScores)


### Name: mvnapp
### Title: MVN Rectangle Probabilities
### Aliases: mvnapp
### Keywords: models

### ** Examples

m<-2
rh<-0.5
a<-c(-1,-1)
b<-c(1,1)
mu<-rep(0,m)
s<-matrix(c(1,rh,rh,1),2,2)
print(mvnapp(a,b,mu,s))
print(mvnapp(a,b,mu,s,type=2))
print(mvnapp(a,b,mu,s,type=2,nsim=3))

m<-3
rh<-0.3
a<-c(-1,-1,-2)
b<-c(1,1,.5)
mu<-rep(0,m)
s<-matrix(c(1,.5,.6,.5,1,.7,.6,.7,1),3,3)
print(mvnapp(a,b,mu,s))
print(mvnapp(a,b,mu,s,type=2))
print(mvnapp(a,b,mu,s,type=2,nsim=3))

m<-4
rh<- -0.1
a<-c(-1,-2.5,-2,-1.5)
b<-c(1.68,1.11,.5,.25)
mu<-rep(0,m)
s<-matrix(c(1,.5,.3,.4,.5,1,.5,.4,.3,.5,1,.4,.4,.4,.4,1),m,m)
print(mvnapp(a,b,mu,s))
print(mvnapp(a,b,mu,s,type=2))
print(mvnapp(a,b,mu,s,type=2,nsim=3))

m<-5
rh<-.4
a<-rep(-1,m)
b<-rep(2,m)
mu<-rep(0,m)
s<-matrix(c(1,rh,rh,rh,rh,rh,1,rh,rh,rh,rh,rh,1,rh,rh,rh,rh,rh,1,
       rh,rh,rh,rh,rh,1),m,m)
print(mvnapp(a,b,mu,s))
print(mvnapp(a,b,mu,s,type=2))
print(mvnapp(a,b,mu,s,type=2,nsim=3))

m<-6
a<-c(-1,-1,-1,-1.5,-1,-2)
b<-rep(7,m)
mu<-rep(0,m)
s<-matrix(c(1,rh,rh,rh,rh,rh,rh,1,rh,rh,rh,rh,rh,rh,1,rh,rh,rh,rh,rh,rh,1,
       rh,rh,rh,rh,rh,rh,1,rh,rh,rh,rh,rh,rh,1),m,m)
print(mvnapp(a,b,mu,s))
print(mvnapp(a,b,mu,s,type=2))
print(mvnapp(a,b,mu,s,type=2,nsim=3))



