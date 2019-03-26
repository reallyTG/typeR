library(fabCI)


### Name: multifabCI
### Title: Multigroup FAB t-intervals
### Aliases: multifabCI
### Keywords: htest

### ** Examples

## -- simulated data
p<-10 ; n<-10
y<-rnorm(n*p) ; g<-rep(1:p,n) 

## -- more interesting data takes longer 
# data(radon) ; y<-radon[,2] ; g<-radon[,1] 

## -- FAB t-intervals
FCI<-multifabCI(y,g) 

## -- UMAU t-intervals 
ybar<-tapply(y,g,mean) ; ssd<-tapply(y,g,sd) ; n<-table(g) 
qtn<-cbind( qt(.025,n-1),  qt(.975,n-1) ) 
UCI<-sweep(sweep(qtn,1,ssd/sqrt(n),"*"),1,ybar,"+") 

mean( (UCI[,2]-UCI[,1])/(FCI[,2]-FCI[,1]) , na.rm=TRUE)




