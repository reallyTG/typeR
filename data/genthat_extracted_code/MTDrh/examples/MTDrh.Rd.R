library(MTDrh)


### Name: MTDrh
### Title: Construct Mass Transportation Distance Rank Histogram
### Aliases: MTDrh
### Keywords: Mass Transportation Distance rank histogram

### ** Examples

#Generate 1000 instances of 10 scenarios and observation with dimension 8 
#from the same normal distribution.

scen <- array(rnorm(8*10*1000,0,1),dim=c(8,10,1000)) 
obs <- array(rnorm(8*1000,0,1),dim=c(8,1000))
ranks <- MTDrh(scen,obs,prob=NULL,debias=FALSE,transformation=FALSE)

#Generate 1000 instances of 27 scenarios and observation with dimension 8 
#from AR(1) processes. The marginal distributions of the scenarios and observation
#are the same but the autocorrelation levels are different. The Mahalanobis
#transformation is applied. See Figure 8 [1].

scen <- array(arima.sim(list(order=c(1,0,0),ar=0.10),n=8*27*1000,sd=1),dim=c(8,27,1000))
obs <- array(arima.sim(list(order=c(1,0,0),ar=0.90),n=8*1000,sd=0.45),dim=c(8,1000))
ranks<-MTDrh(scen,obs,prob=NULL,debias=FALSE,transformation=TRUE)
hist(ranks, breaks=c(0:28),xlab="bin",ylab="frequency",col="gray",main="MTD rh")

#Generate 1000 instances of 27 scenarios that have heterogeneous autocorrelation
#levels and corresponding observations with autocorrelation different
#from the scenarios.
#The marginal standard deviations of scenarios and observation match.  See Figure 9 [1]

scen1 <- array(arima.sim(list(order=c(1,0,0),ar=0.10),n=8*10*1000,sd=1),dim=c(8,10,1000))
scen2 <- array(arima.sim(list(order=c(1,0,0),ar=0.80),n=8*17*1000,sd=0.64),dim=c(8,17,1000))
scen <- array(NA,dim=c(8,27,1000))
scen[,1:10,]<-scen1
scen[,11:27,]<-scen2
obs <- array(arima.sim(list(order=c(1,0,0),ar=0.50),n=8*1000,sd=0.86),dim=c(8,1000))
ranks<-MTDrh(scen,obs,prob=NULL,debias=FALSE,transformation=TRUE)
hist(ranks, breaks=c(0:28),xlab="bin",ylab="frequency",col="gray",main="MTD rh")




