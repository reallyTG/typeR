library(kzfs)


### Name: kzp2
### Title: Check Images' Motion Scales with 2D KZ Periodogram Signals
### Aliases: kzp2 smooth.kzp2 kzp2.summary
### Keywords: 2D-periodogram

### ** Examples

dx <- 100				# x range
dy <- 120				# y range
b <- expand.grid(x=1:dx, y=1:dy)
q1 <- pi/6; f1 <- 0.2;
b$v1 <- sin(f1*2*pi*(b$x*cos(q1)+b$y*sin(q1))+100*runif(1))
q2 <- pi/4; f2 <- 0.08;
b$v2 <- sin(f2*2*pi*(b$x*cos(q2)+b$y*sin(q2))+100*runif(1))
a <- array(0,c(dx,dy))
a[as.matrix(b[,1:2])] <- b$v1 + 1.5*b$v2
a <- a + 10*matrix(rnorm(dx*dy,0,1),ncol=dy)

rp <- kzp2(a)			# raw 2D spectrum

fy <- rp$freq.y; fx <- rp$freq.x; rp <- rp$kzp2d

# smoothing 2D spectrum 2 times
sp <- smooth.kzp2(rp,0.01,k=2)	

par(mfrow=c(2,1), cex=0.5)
persp(x=fx, y=fy, z=rp, expand =0.5,
	main = "Raw 2D KZ Periodogram", ltheta=40, shade=0.75,
	theta=-30, phi=15, zlab="",xlab="x", ylab="y",
	ticktype="detailed", col="lightblue")

persp(x=fx, y=fy, z=sp, expand =0.5,
	main = "Smoothed 2D KZ Periodogram", ltheta=40, shade=0.75,
	theta=-30, phi=25, zlab="",xlab="x", ylab="y",
	ticktype="detailed", col="lightblue")
par(mfrow=c(1,1), cex=1)

kzp2.summary(sp)		# direction & frequency




