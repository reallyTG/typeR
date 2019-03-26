library(bayesdistreg)


### Name: distreg
### Title: Bayesian distribution regression
### Aliases: distreg

### ** Examples

data0=faithful[,c(2,1)]; qnt<-quantile(data0[,1],0.25)
distob<- distreg(qnt,data0,iter = 102, burn = 2); 
plot(density(distob,.1),main="Kernel density plot")




