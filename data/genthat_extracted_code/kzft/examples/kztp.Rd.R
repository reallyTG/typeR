library(kzft)


### Name: kztp
### Title: Kolmogorov-Zurbenko Third-Order Periodogram and Smoothing Method
### Aliases: kztp variation.kztp smooth.kztp
### Keywords: ts

### ** Examples


#example 1

t<-1:10000
y<-sin(2*pi*0.1*t)+sin(2*pi*0.2*t)+rnorm(10000,0,3)

pg3.y<-kztp(y,100,1,0.5,1)$mod
pg3.y<-log(pg3.y)
spg3.y<-smooth.kztp(pg3.y,0.01,20)$bispectrum

omega<-seq(0,1,length=101)[2:51]

par(mfrow=c(2,1))
persp(omega, omega, pg3.y, theta = 30, phi = 30, expand = 0.5, col = "lightblue", 
      ltheta = 120, shade = 0.75, ticktype = "detailed", xlab = "Frequency (cycles/time unit)", 
      ylab = "Frequency (cycles/time unit)", main = "3rd-order Periodogram") 
persp(omega, omega, spg3.y, theta = 30, phi = 30, expand = 0.5, col = "lightblue",
      ltheta = 120, shade = 0.75, ticktype = "detailed", xlab = "Frequency (cycles/time unit)",
      ylab = "Frequency (cycles/time unit)", main = "Smoothed 3rd-order Periodogram")

filled.contour(omega,omega,pg3.y,xlab="Frequency (cycles/time unit)",ylab="Frequency (cycles/time unit)",
               main="3rd-order Periodogram")
filled.contour(omega,omega,spg3.y,xlab="Frequency (cycles/time unit)",ylab="Frequency (cycles/time unit)",
               main="Smoothed 3rd-order Periodogram3")

#example 2
#effect of KZFT

t<-1:50000
y<-1.1*sin(2*pi*0.0339*t)+7*sin(2*pi*0.0366*t)+2*rnorm(50000,0,1)

pg3.y1<-kztp(y,1000,1,0.5,1,rp1=0.02,rp2=0.05,cp1=0.02,cp2=0.05)$mod
pg3.y2<-kztp(y,1000,3,0.5,1,rp1=0.02,rp2=0.05,cp1=0.02,cp2=0.05)$mod
pg3.y1<-log(pg3.y1)
pg3.y2<-log(pg3.y2)
spg3.y1<-smooth.kztp(pg3.y1,0.01,10)$bispectrum
spg3.y2<-smooth.kztp(pg3.y2,0.01,10)$bispectrum

omega<-seq(0,1,length=1001)[21:51]
par(mfrow=c(2,2))
persp(omega, omega, pg3.y1, theta = 30, phi = 30, expand = 0.5, col = "lightblue",
      ltheta = 120, shade = 0.75, ticktype = "detailed", xlab = "Frequency (cycles/time unit)",
      ylab = "Frequency (cycles/time unit)", main = "Original, m=1000, k=1") 
persp(omega, omega, pg3.y2, theta = 30, phi = 30, expand = 0.5, col = "lightblue", 
      ltheta = 120, shade = 0.75, ticktype = "detailed", xlab = "Frequency (cycles/time unit)", 
      ylab = "Frequency (cycles/time unit)", main = "Original, m=1000, k=3")
persp(omega, omega, spg3.y1, theta = 30, phi = 30, expand = 0.5, col = "lightblue", 
      ltheta = 120, shade = 0.75, ticktype = "detailed", xlab = "Frequency (cycles/time unit)", 
      ylab = "Frequency (cycles/time unit)", main = "Smoothed, m=1000, k=1") 
persp(omega, omega, spg3.y2, theta = 30, phi = 30, expand = 0.5, col = "lightblue", 
      ltheta = 120, shade = 0.75, ticktype = "detailed", xlab = "Frequency (cycles/time unit)", 
      ylab = "Frequency (cycles/time unit)", main = "Smoothed, m=1000, k=3")

filled.contour(omega,omega,pg3.y1,xlab="Frequency (cycles/time unit)",ylab="Frequency (cycles/time unit)",
               main="Original, m=1000, k=1")
filled.contour(omega,omega,pg3.y2,xlab="Frequency (cycles/time unit)",ylab="Frequency (cycles/time unit)",
               main="Original, m=1000, k=3")
filled.contour(omega,omega,spg3.y1,xlab="Frequency (cycles/time unit)",ylab="Frequency (cycles/time unit)",
               main="Smoothed, m=1000, k=1")
filled.contour(omega,omega,spg3.y2,xlab="Frequency (cycles/time unit)",ylab="Frequency (cycles/time unit)",
               main="Smoothed, m=1000, k=3")



