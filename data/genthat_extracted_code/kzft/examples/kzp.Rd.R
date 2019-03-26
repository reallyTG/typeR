library(kzft)


### Name: kzp
### Title: Kolmogorov-Zurbenko Periodogram and Smoothing Methods
### Aliases: kzp nonlinearity.kzp variation.kzp smooth.kzp
### Keywords: ts

### ** Examples


#example 1
#show the effect of smoothing methods

N<-480
x<-rep(0,N)

x[1:4]<-rnorm(4)

for ( t in 5:N ) 
{ 
x[t]<-2.76*x[t-1]-3.81*x[t-2]+2.65*x[t-3]-0.92*x[t-4]+rnorm(1)
}

for ( t in 1:N ) 
{
x[t]<-50*cos( 2*pi*(10/N)*t)+40*cos( 2*pi*(20/N)*t )+x[t]
}

kzp.x<-log(kzp(x,480,1))
spg.x1<-smooth.kzp(kzp.x,0.03, method="DZ")$periodogram
spg.x2<-smooth.kzp(kzp.x,0.03, method="NZ")$periodogram

omega<-seq(0,1,length=481)[2:241]

par(mfrow=c(2,2))
plot(omega,kzp.x,main="Raw periodogram",type="l", xlab="Frequency (cycles/time unit)", ylab=" ")
plot(omega,spg.x1,main="Smoothed Periodogram using DZ method",type="l", xlab="Frequency (cycles/time unit)", ylab=" ")
plot(omega,spg.x2,main="Smoothed Periodogram using NZ method",type="l", xlab="Frequency (cycles/time unit)", ylab=" ")

#example 2
#show the effect of KZFT
t<-1:2000
y<-1.1*sin(2*pi*0.0339*t)+7*sin(2*pi*0.0366*t)+2*rnorm(1000,0,1)
kzp.y1<-log(kzp(y,1000,1,0.1,1))
kzp.y2<-log(kzp(y,500,2,0.1,2))

spg.y1<-smooth.kzp(kzp.y1,0.01, method="NZ")$periodogram
spg.y2<-smooth.kzp(kzp.y2,0.01, method="NZ")$periodogram

omega<-seq(0,1,length=1001)[21:61]
par(mfrow=c(2,2))
plot(omega,kzp.y1[20:60], main="Periodogram m=1000, k=1", type="l", xlab="Frequency (cycles/time unit)", ylab=" ")
plot(omega,kzp.y2[20:60], main="Periodogram m=500, k=2", type="l", xlab="Frequency (cycles/time unit)", ylab=" ")
plot(omega,spg.y1[20:60], main="Smoothed Periodogram m=1000, k=1", type="l", xlab="Frequency (cycles/time unit)", ylab=" ")
plot(omega,spg.y2[20:60], main="Smoothed Periodogram m=500, k=2", type="l", xlab="Frequency (cycles/time unit)", ylab=" ")




