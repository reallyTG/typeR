library(kza)


### Name: kza
### Title: Kolmogorov-Zurbenko Adaptive
### Aliases: kza plot.kza
### Keywords: ts

### ** Examples

#######
# this is an example of detection of a break point in a time series
#######
yrs <- 20
t <- seq(0,yrs,length=yrs*365)
m <- 365

#noise
e <- rnorm(n = length(t),0,1)
trend <- seq(0,-1,length=length(t))

#signal
bkpt <- 3452
brk <- c(rep(0,bkpt),rep(0.5,length(t)-bkpt))
signal <- trend + brk

# y = seasonal + trend + break point + noise
y <- sin(2*pi*t) + signal + e

k.kz <- kz(y,m)

# kza reconstruction of the signal
k.kza <- kza(y,m,y=k.kz,min_size=10)

par(mfrow=c(2,1))
plot(y,type="l", ylim=c(-3,3))
plot(signal,type="l",ylim=c(-3,3), 
    main="Signal and KZA Reconstruction")
lines(k.kza$kza, col=4)

######################
# image detection (2d)
######################
set.seed(2)
a <- matrix(rep(0,100*100),nrow=100)
a[35:70,35:70]<-1
a <- a + matrix(rnorm(100*100,0,1),nrow=100)
y<-kz(a,m=15,k=3)
v <- kza(a,m=15,y=y,k=3,impute_tails=TRUE)

x <- seq(1,100)
y <- x
op <- par(bg = "white")

###
#noise
###
c="lightblue"
persp(x, y, a, zlab="z", zlim=c(-5,5), ticktype="detailed", theta=30, phi=30, col=c)

###
#kza filtered
###
persp(x,y,v$kza,zlab="z",zlim=c(-5,5),ticktype="detailed",theta=30,phi=30,col=c)

###
# another view
###
par(mfrow=c(1,2))
image(a,col=gray(seq(0,1,1/255)))
image(v$kza,col=gray(seq(0,1,1/255)))
par(mfrow=c(1,1))




