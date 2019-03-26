library(Lmoments)


### Name: data2normpoly
### Title: Estimation of normal-polynomial quantile mixture
### Aliases: data2normpoly4 lmom2normpoly4 data2normpoly6 lmom2normpoly6
### Keywords: distribution robust

### ** Examples

#Generates a sample 500 observations from the normal-polynomial quantile mixture, 
#calculates L-moments and their covariance matrix,
#estimates parameters via L-moments and 
#plots the true pdf and the estimated pdf together with the histogram of the data.
true_params<-lmom2normpoly4(c(0,1,0.2,0.05));
x<-rnormpoly(500,true_params);
lmoments<-Lmoments(x);
lmomcov<-Lmomcov(x);
estim_params<-lmom2normpoly4(lmoments);
hist(x,30,freq=FALSE);
plotpoints<-seq(min(x)-1,max(x)+1,by=0.01);
lines(plotpoints,dnormpoly(plotpoints,estim_params),col='red');
lines(plotpoints,dnormpoly(plotpoints,true_params),col='blue');



