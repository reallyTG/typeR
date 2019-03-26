library(kza)


### Name: kztp
### Title: Kolmogorov-Zurbenko Third-Order Periodogram
### Aliases: kztp

### ** Examples

t<-1:10000
y<-2*sin(2*pi*0.1*t)+3*sin(2*pi*0.2*t) + 10*rnorm(length(t))

a<-kztp(y,50,1)
z<-log(Mod(a))
#z<-smooth.kzp(z)

omega<-seq(0,1,length=51)[2:26]
#filled.contour(omega,omega,s,xlab="freq",ylab="freq",main="Smoothed 3rd Order Periodogram")



