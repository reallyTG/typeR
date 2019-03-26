library(quantregGrowth)


### Name: gcrq
### Title: Growth charts regression quantiles
### Aliases: gcrq
### Keywords: regression model smooth

### ** Examples

## Not run: 
##D data(growthData) #load data
##D tauss<-seq(.1,.9,by=.1) #fix the percentiles of interest
##D 
##D m1<-gcrq(y~ps(x, mon=0), tau=tauss, data=growthData) #unpenalized.. very wiggly curves
##D #strongly penalized models
##D m2<-gcrq(y~ps(x, mon=0, lambda=1000, d=2), tau=tauss, data=growthData) #linear 
##D m3<-gcrq(y~ps(x, mon=0, lambda=1000, d=3), tau=tauss, data=growthData) #quadratic  
##D 
##D #penalized model with monotonicity restrictions
##D m4<-gcrq(y~ps(x, mon=1, lambda=10), tau=tauss, data=growthData)
##D 
##D #monotonicity constraints with varying penalty
##D m5<-gcrq(y~ps(x, mon=1, lambda=10, var.pen="(1:k)^3"), tau=tauss, data=growthData) 
##D 
##D par(mfrow=c(2,2))
##D plot(m1, pch=20, res=TRUE)
##D plot(m2, pch=20, res=TRUE)
##D plot(m3, add=TRUE, lwd=2)
##D plot(m4, pch=20, res=TRUE)
##D plot(m5, pch=20, res=TRUE, legend=TRUE)
##D 
##D #select lambda via 'K-fold' CV
##D m6<-gcrq(y~ps(x, lambda=seq(0.02,100,l=20)), tau=tauss, data=growthData) 
##D par(mfrow=c(1,2))
##D plot(m6, cv=TRUE) #display CV score versus lambda values
##D plot(m6, res=TRUE, grid=list(x=5, y=8)) #fitted curves at the best lambda value
##D 
## End(Not run)



