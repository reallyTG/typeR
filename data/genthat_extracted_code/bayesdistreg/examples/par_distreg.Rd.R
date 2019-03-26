library(bayesdistreg)


### Name: par_distreg
### Title: Parallel compute bayesian distribution regression
### Aliases: par_distreg

### ** Examples

data0=faithful[,c(2,1)]; qnts<-quantile(data0[,1],c(0.05,0.25,0.5,0.75,0.95))
out<- par_distreg(qnts,data0,no_cores=1,iter = 102, burn = 2)
par(mfrow=c(3,2));invisible(apply(out,1,function(x)plot(density(x,30))));par(mfrow=c(1,1))




