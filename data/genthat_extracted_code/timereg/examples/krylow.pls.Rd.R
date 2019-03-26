library(timereg)


### Name: krylow.pls
### Title: Fits Krylow based PLS for additive hazards model
### Aliases: krylow.pls
### Keywords: survival

### ** Examples


## makes data for pbc complete case
data(mypbc)
pbc<-mypbc
pbc$time<-pbc$time+runif(418)*0.1; pbc$time<-pbc$time/365
pbc<-subset(pbc,complete.cases(pbc));
covs<-as.matrix(pbc[,-c(1:3,6)])
covs<-cbind(covs[,c(1:6,16)],log(covs[,7:15]))

## computes the matrices needed for the least squares 
## criterion 
out<-aalen(Surv(time,status>=1)~const(covs),pbc,robust=0,n.sim=0)
S=out$intZHZ; s=out$intZHdN;

out<-krylow.pls(S,s,dim=2)




