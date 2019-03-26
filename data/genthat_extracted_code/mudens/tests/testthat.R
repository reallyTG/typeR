context("testthat.R")
library(mudens)

# Example 1: Mixture of two normals 
x1 = rnorm(100, 2, 0.5)
x2 = rnorm(100, 4, 0.5)
xx = c(x1, x2)
# mudens density estimation of two normal mixtures based on 
# global bandwidth \& boundary correction 
fit = mudens(xx, max.time=max(xx), bw.method='g')
plot.mudens(fit)
rug(xx)
summary.mudens(fit)


# mudens density estimation of two normal mixtures based on 
#  global bandwidth & boundary correction 
fit = mudens(xx, max.time=max(xx), bw.method='loc')
par(mfrow=c(1,2))
plot.mudens(fit)
rug(xx)	

# To view local bandwidth function  
plot(fit$pin$min.grid, fit$bw.loc)	
lines(fit$est.grid, fit$bw.loc.sm)
rug(xx)


summary.mudens(fit)



# mudens density estimation of two normal mixtures based on nearest neighbors 
# bandwidth and boundary correction method
fit = mudens(xx, max.time=max(xx), bw.method='knn')
par(mfrow=c(1,2))
plot.mudens(fit)
rug(xx)	
# To view knn bandwidth function  
plot(fit$pin$min.grid, fit$bw.loc)	
lines(fit$est.grid, fit$bw.loc.sm)
rug(xx)

summary.mudens(fit)



# Example 2:
x1 = rexp(200)
# mudens density estimation of exponential distribution based on global
# bandwidth and boundary correction method
fit = mudens(x1, max.time=max(x1), bw.method='g')
par(mfrow=c(1,1))
plot.mudens(fit)
rug(x1)

# To print out the optimized global bandwidth
fit$bw.glob

# Obtain the summary estimation results
summary.mudens(fit)


fit = mudens(x1, max.time=max(x1), bw.method='g', bw.grid=1.5, b.cor='none')
par(mfrow=c(1,1))
plot.mudens(fit)
rug(x1)
summary(fit)



# mudens density estimation of exponential distribution based on 
#  local bandwidth but no boundary correction 
fit = mudens(x1, max.time=max(x1), b.cor='none')
par(mfrow=c(1,2))
plot.mudens(fit)
rug(x1)
summary(fit)

# To view local bandwidth function
plot(fit$pin$min.grid, fit$bw.loc)
lines(fit$est.grid, fit$bw.loc.sm)



# mudens density estimation of exponential distribution based on 
#  knn bandwidth and boundary correction 
fit = mudens(x1, max.time=max(x1), bw.method='knn')
par(mfrow=c(1,2))
plot.mudens(fit)
rug(x1)
summary(fit)

plot(fit$pin$min.grid, fit$bw.loc, cex=0.8)
lines(fit$est.grid, fit$bw.loc.sm)



#Mixture of exp and normal
x1<-rexp(200)
x2<-rnorm(100,4,.5) 
xx<-c(x1,x2)
#plot series of estimates with different bandwidths
fit<-mudens(xx,max.time=max(xx),bw.method='g',bw.grid=1.5)
par(mfrow=c(1,1))
plot(fit)
rug(xx)
lines(fit$est.grid,fit$haz.est,col=1,lwd=3)
fit2<-mudens(xx,max.time=max(xx),bw.method='g',bw.grid=1)
lines(fit2$est.grid,fit2$haz.est,col=2,lwd=3)
fit3<-mudens(xx,max.time=max(xx),bw.method='g',bw.grid=.5)
lines(fit3$est.grid,fit3$haz.est,col=3,lwd=3)
fit4<-mudens(xx,max.time=max(xx),bw.method='g',bw.grid=2)
lines(fit4$est.grid,fit4$haz.est,col=4,lwd=3)
fit5<-mudens(xx,max.time=max(xx),bw.method='g',bw.grid=2.5)
lines(fit5$est.grid,fit5$haz.est,col=5,lwd=3)
legend(2,.6,c('b/w = 0.5','b/w = 1.0','b/w = 1.5','b/w = 2.0','b/w = 2.5'),
       col=c(3,2,1,4,5),lwd=rep(3,5))
   
	   
# Right-censored exponential 
x<-rexp(200)
censor<-runif(200,0,10)
sx<-pmin(x,censor)
sta<-(sx==x)

#compare estimates from uncensored and censored data
#using local bandwidth, with left boundary correction

fit1<-mudens(x,max.time=max(x),b.cor="left")
fit2<-mudens(sx,sta,max.time=max(sx),b.cor="left")
plot(x,rep(1:200),type="n",xlim=c(0,max(x,sx)),ylim=c(0,1),xlab="Time",ylab="Density")
lines(fit1$est.grid,fit1$haz.est,col=1,lwd=3)
lines(fit2$est.grid,fit2$haz.est,col=2,lwd=3)
rug(x)
legend(3,1.0,c('Uncensored','Right-censored'),col=1:2,lwd=c(3,3))
 
#compare bandwidth functions

plot(fit1$pin$min.grid, fit1$bw.loc,xlim=c(0,5),xlab="Time",ylab="Bandwidth")  
lines(fit1$est.grid, fit1$bw.loc.sm,lwd=3)
points(fit2$pin$min.grid, fit2$bw.loc,pch=19,col=2)
lines(fit2$est.grid, fit2$bw.loc.sm,col=2,lwd=3)
 

summary(fit2)
