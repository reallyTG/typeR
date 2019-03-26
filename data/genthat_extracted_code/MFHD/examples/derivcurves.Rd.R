library(MFHD)


### Name: derivcurves
### Title: Computes the derivative of functional data.
### Aliases: derivcurves
### Keywords: functional

### ** Examples

set.seed(123)	
n<-50;
T<-100;	 
t.<-seq(0,2*pi,l=T)
y<-matrix(NA,n,T)
for(i in 1:n)	y[i,]<-runif(1,0,1)*sin(t.)+runif(1,0,1)*cos(t.)
y2<-derivcurves(y)	



