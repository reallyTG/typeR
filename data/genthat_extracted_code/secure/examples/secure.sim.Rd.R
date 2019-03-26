library(secure)


### Name: secure.sim
### Title: Simulation model
### Aliases: secure.sim

### ** Examples

#require(secure)

# Simulate data from a sparse factor regression model
p <- 100; q <- 50; n <- 300
snr <- 0.5; ssigma <- 0.5; nlambda <- 200 
nrank <- 3

U <- matrix(0,ncol=nrank ,nrow=p);  V <- matrix(0,ncol=nrank ,nrow=q)
U[,1]<-c(sample(c(1,-1),8,replace=TRUE),rep(0,p-8))
U[,2]<-c(rep(0,5),sample(c(1,-1),9,replace=TRUE),rep(0,p-14))
U[,3]<-c(rep(0,11),sample(c(1,-1),9,replace=TRUE),rep(0,p-20))
V[,1]<-c(sample(c(1,-1),5,replace=TRUE)*runif(5,0.3,1),rep(0,q-5))
V[,2]<-c(rep(0,5),sample(c(1,-1),5,replace=TRUE)*runif(5,0.3,1),rep(0,q-10))
V[,3]<-c(rep(0,10),sample(c(1,-1),5,replace=TRUE)*runif(5,0.3,1),rep(0,q-15))
U[,1:3]<- apply(U[,1:3],2,function(x)x/sqrt(sum(x^2)))
V[,1:3]<- apply(V[,1:3],2,function(x)x/sqrt(sum(x^2)))
D <- diag(c(20,15,10)) 
C <- U%*%D%*%t(V)

Xsigma <- ssigma^abs(outer(1:p, 1:p,FUN="-"))
sim.sample <- secure.sim(U,D,V,n,snr,Xsigma)
Y <- sim.sample$Y
X <- sim.sample$X




