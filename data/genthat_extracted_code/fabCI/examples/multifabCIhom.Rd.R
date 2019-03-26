library(fabCI)


### Name: multifabCIhom
### Title: Multigroup FAB t-intervals for the homoscedastic model
### Aliases: multifabCIhom
### Keywords: htest

### ** Examples

## -- simulate the data
mu = 0; sigma2 = 10; tau2 = 1; p =100; 
theta = rnorm(p,mu,sqrt(tau2))
ns = round(runif(p,2,18))
Y=c()
for(i in 1:p){
 d2 = rnorm(ns[i],theta[i],sqrt(sigma2))
 d1 = rep(i,ns[i])
 d = cbind(d1,d2)
 Y = rbind(Y,d)}
y = Y[,2]
g = Y[,1]

## -- FAB t-intervals
FCI = multifabCIhom(y,g)  

## -- UMAU t-intervals 
ybar<-tapply(y,g,mean) ; ssd<-tapply(y,g,sd) ; n<-table(g) 
qtn<-cbind( qt(.025,n-1),  qt(.975,n-1) ) 
UCI<-sweep(sweep(qtn,1,ssd/sqrt(n),"*"),1,ybar,"+") 

mean( (UCI[,2]-UCI[,1])/(FCI[,2]-FCI[,1]) , na.rm=TRUE)





