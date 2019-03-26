library(Lmoments)


### Name: data2cauchypoly
### Title: Estimation of the Cauchy-polynomial quantile mixture
### Aliases: data2cauchypoly4 t1lmom2cauchypoly4
### Keywords: distribution robust

### ** Examples

#Generates 500 random variables from the Cauchy-polynomial quantile mixture, 
#calculates the trimmed L-moments,
#estimates parameters via trimmed L-moments and 
#plots the true pdf and the estimated pdf together with the histogram of the data.
true_params<-t1lmom2cauchypoly4(c(0,1,0.075,0.343));
x<-rcauchypoly(500,true_params);
t1lmom<-t1lmoments(x);
estim_params<-t1lmom2cauchypoly4(t1lmom);
plotpoints<-seq(-10,10,by=0.01);
histpoints<-c(seq(min(x)-1,-20,length.out=50),seq(-10,10,by=0.5),seq(20,max(x)+1,length.out=50));
hist(x,breaks=histpoints,freq=FALSE,xlim=c(-10,10));
lines(plotpoints,dcauchypoly(plotpoints,estim_params),col='red');
lines(plotpoints,dcauchypoly(plotpoints,true_params),col='blue');



