library(elliptic)


### Name: theta.neville
### Title: Neville's form for the theta functions
### Aliases: theta.neville theta.s theta.c theta.d theta.n e16.36.6
###   e16.36.6a e16.36.6b e16.36.7 e16.36.7a e16.36.7b e16.37.1 e16.37.2
###   e16.37.3 e16.37.4 e16.38.1 e16.38.2 e16.38.3 e16.38.4
### Keywords: math

### ** Examples

#Figure 16.4.
m <- 0.5
K <- K.fun(m)
Kdash <- K.fun(1-m)
x <- seq(from=0,to=4*K,len=100)
plot  (x/K,theta.s(x,m=m),type="l",lty=1,main="Figure 16.4, p578")
points(x/K,theta.n(x,m=m),type="l",lty=2)
points(x/K,theta.c(x,m=m),type="l",lty=3)
points(x/K,theta.d(x,m=m),type="l",lty=4)
abline(0,0)



#plot a graph of something that should be zero:
 x <- seq(from=-4,to=4,len=55)
 plot(x,(e16.37.1(x,0.5)-theta.s(x,0.5)),pch="+",main="error: note vertical scale")

#now table 16.1 on page 582 et seq:
 alpha <- 85
 m <- sin(alpha*pi/180)^2
## K <- ellint_Kcomp(sqrt(m))
 K <- K.fun(m)
 u <- K/90*5*(0:18)
 u.deg <- round(u/K*90)
 cbind(u.deg,"85"=theta.s(u,m))      # p582, last col. 
 cbind(u.deg,"85"=theta.n(u,m))      # p583, last col. 





