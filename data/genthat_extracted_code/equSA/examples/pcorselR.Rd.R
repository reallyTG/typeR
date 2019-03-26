library(equSA)


### Name: pcorselR
### Title: Multiple hypothesis test
### Aliases: pcorselR
### Keywords: pcorselR

### ** Examples

## No test: 
library(equSA)
data(SR0)
U <- psical(SR0, ALPHA1=0.05,iteration=50)
##   probit transformation for psi scores ###
z<-U[,3]
q<-pnorm(-abs(z), log.p=TRUE)
q<-q+log(2.0)
s<-qnorm(q,log.p=TRUE)
s<-(-1)*s
U<-cbind(U[,1:2],s)
## subsampling for psi scores ###
N <- length(U[,1])
ratio<-ceiling(N/100000)
U<-U[order(U[,3]), 1:3]
m<-floor(N/ratio)
m0<-N-m*ratio
s<-sample.int(ratio,m,replace=TRUE)
for(i in 1:length(s)) s[i]<-s[i]+(i-1)*ratio
if(m0>0){
  s0<-sample.int(m0,1)+length(s)*ratio
  s<-c(s,s0)
}
Us<-U[s,]
y <- round(Us,6)
##  multiple hypothesis tests ###
pcorselR(y,ALPHA2=0.05)
## End(No test)     



