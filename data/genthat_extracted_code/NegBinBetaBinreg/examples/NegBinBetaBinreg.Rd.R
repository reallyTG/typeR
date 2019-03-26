library(NegBinBetaBinreg)


### Name: NegBinBetaBinreg
### Title: NegBinBetaBinreg
### Aliases: NegBinBetaBinreg
### Keywords: Bayesian Metropolis Hastings Meancovariance modelling
###   Negative Binomial Beta Binomial

### ** Examples


rm(list=ls(all=TRUE))

Y<-c(6,6,9,13,23,25,32,53,54,5,5,11,17,19,2,8,13,14,20,47,
     48,60,81,6,17,67,0,0,2,7,11,12,0,0,5,5,5,11,17,3,4,22,
     30,36,0,1,5,7,8,16,27,25,10,11,20,33,0,1,5,5,5,5,5,7,7,11,15,5,6,6,7,14
)
y <- Y <- Y[1:68]

x0<-rep(1,times=68)
x2<-c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,
      1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
)
x3<-c(0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,
      0,1,1,1,1,1,1,0,0,0,0,0,0,0,1,1,0,0,0,1,1,1,1,1,1,1,
      0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1
)
x<-cbind(x0,x2,x3)
z0<-rep(1,times=68)
z<-cbind(z0,x2)

Bpri=diag(rep(1,3))
bpri=rep(0,3)
Gpri=diag(rep(1,2))
gpri=rep(0,2)

Bini=diag(rep(1,3))
bini=c(3,-1,-0.5)
Gini=diag(rep(1,2))
gini=c(3,-1)

nsim = 300
burn <- 0.1
jump <- 5
model <- "NB1"
m <- 360
ni <- NULL
re<- NegBinBetaBinregEst (y,x,z,nsim,bpri,
	Bpri,gpri,Gpri,burn,jump,bini,gini,
	model,m,ni,graph1=FALSE,graph2=FALSE)
summary(re)



