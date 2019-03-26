library(MFHD)


### Name: MFHD
### Title: Multivariate functional halfspace depth and median for
###   two-dimensional functional data.
### Aliases: MFHD
### Keywords: Functional data

### ** Examples

set.seed(123)
n<-30;
T<-60;
t.<-seq(0,2*pi,l=T)
y1<-matrix(NA,n,T)
for(i in 1:n) y1[i,]<-loess((1/2*sin(t.)+3/2*cos(t.)+rnorm(T))~I(1:T),span=1/4)$fitted
y2<-derivcurves(y1)
results<-MFHD(y1=y1,y2=y2,alpha=0.125,Beta=0.5) 



