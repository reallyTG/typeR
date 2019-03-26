library(regpro)


### Name: pcf.kernesti.slice
### Title: A slice of a multivariate kernel regression estimator
### Aliases: pcf.kernesti.slice
### Keywords: multivariate smooth

### ** Examples

n<-100
d<-2 
x<-8*matrix(runif(n*d),n,d)-3
C<-(2*pi)^(-d/2)
phi<-function(x){ return( C*exp(-sum(x^2)/2) ) }
D<-3; c1<-c(0,0); c2<-D*c(1,0); c3<-D*c(1/2,sqrt(3)/2)
func<-function(x){phi(x-c1)+phi(x-c2)+phi(x-c3)}
y<-matrix(0,n,1)
for (i in 1:n) y[i]<-func(x[i,])+0.01*rnorm(1)

num<-30  # number of grid points in one direction
pcf<-pcf.kernesti.slice(x,y,h=0.5,N=num)

dp<-draw.pcf(pcf,minval=min(y))
plot(dp$x,dp$y,type="l")



