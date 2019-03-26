library(kzft)


### Name: kzw
### Title: Kolmogorov-Zurbenko Wavelet
### Aliases: kzw kzww
### Keywords: ts

### ** Examples

# example
t=1:999
p1=rep(10,333)
p2=rep(20,333)
p=c(p1,p2,p1)
f=1/p

x=sin(2*pi*f*t)+rnorm(999,0,1)
plot(t,x,type='l',xlab="Time unit")

kzw.x=kzw(x,30/999,120/999,1/999,1,999,1,7,5)
ff=30:120/999
contour(t,ff,kzw.x$em, xlab="Time unit", ylab="Frequency (cycles/time unit)")
lines(t,f,col="red")



