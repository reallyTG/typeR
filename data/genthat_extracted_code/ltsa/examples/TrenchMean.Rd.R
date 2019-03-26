library(ltsa)


### Name: TrenchMean
### Title: Exact MLE for mean given the autocorrelation function
### Aliases: TrenchMean
### Keywords: ts

### ** Examples

#compare BLUE and sample mean
phi<- -0.9
a<-rnorm(100)
z<-numeric(length(a))
phi<- -0.9
n<-100
a<-rnorm(n)
z<-numeric(n)
mu<-100
sig<-10
z[1]<-a[1]*sig/sqrt(1-phi^2)
for (i in 2:n)
	z[i]<-phi*z[i-1]+a[i]*sig
z<-z+mu
r<-phi^(0:(n-1))
meanMLE<-TrenchMean(r,z)
meanBLUE<-mean(z)
ans<-c(meanMLE, meanBLUE)
names(ans)<-c("BLUE", "MLE")
ans



