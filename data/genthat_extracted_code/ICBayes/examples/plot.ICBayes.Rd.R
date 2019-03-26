library(ICBayes)


### Name: plot.ICBayes
### Title: Plot baseline survival function
### Aliases: plot.ICBayes

### ** Examples

data(bcdata)
try<-ICBayes(Surv(L,R,type='interval2')~x1,data=data.frame(bcdata),
model='case2ph',status=bcdata[,3],p=1,x_user=c(1),
knots=seq(0.1,60.1,length=10),grids=seq(0.1,60.1,by=1),niter=500,burnin=100)
plot.ICBayes(try$grids,try$S0_m)



