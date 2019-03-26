library(bayesdistreg)


### Name: distreg_cfa
### Title: Counterfactual bayesian distribution regression
### Aliases: distreg_cfa

### ** Examples

data0=faithful[,c(2,1)]; qnt<-quantile(data0[,1],0.25)
cfIND=2 #Note: the first column is the outcome variable. 
cft=0.95*data0[,cfIND] # a decrease by 5%
dist_cfa<- distreg_cfa(qnt,data0,cft,cfIND,MH="IndepMH",iter = 102, burn = 2)
par(mfrow=c(1,2)); plot(density(dist_cfa$counterfactual,.1),main="Original")
plot(density(dist_cfa$counterfactual,.1),main="Counterfactual"); par(mfrow=c(1,1))




