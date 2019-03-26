library(kzfs)


### Name: kzrc2
### Title: Reconstruct 2D Wave Signals For Given Directions with KZFT
### Aliases: kzrc2 kz.rc2
### Keywords: KZFT reconstruction

### ** Examples

dx <- 100			# The x and y scale of the wave field
dy <- 100			# Enlarge them to 300 to get better result.

b <- expand.grid(x=1:dx, y=dy:1)
q1 <- pi/6; f1 <- 0.1;
b$v1 <- sin(f1*2*pi*(b$x*cos(q1)+b$y*sin(q1))+runif(1))
a1 <- array(0,c(dx,dy))
a1[as.matrix(b[,1:2])] <- b$v1
q2 <- -pi/3; f2 <- 0.15;
b$v2 <- sin(f2*2*pi*(b$x*cos(q2)+b$y*sin(q2))+runif(1))
a2 <- array(0,c(dx,dy))
a2[as.matrix(b[,1:2])] <- b$v2
a <- array(0,c(dx,dy))
a[as.matrix(b[,1:2])] <- b$v1 + 2.5*b$v2
noise <- matrix(rnorm(dx*dy,0,1),ncol=dy)

persp(1:(dx/2), 1:(dy/2), a1[1:(dx/2), 1:(dy/2)], zlab="",
	main="wave #1", theta=0, phi=45, ticktype="detailed", col="lightblue")
persp(1:(dx/2), 1:(dy/2), a2[1:(dx/2), 1:(dy/2)], 
	main="wave #2", theta=90, phi=-110, ticktype="detailed", col="lightblue")
persp(1:(dx/2), 1:(dy/2), a[1:(dx/2), 1:(dy/2)], 
	main="wave #1 + #2 ", theta=90, phi=-110, ticktype="detailed", col="lightblue")
persp(1:(dx/2), 1:(dy/2), a[1:(dx/2), 1:(dy/2)] + 5*noise[1:(dx/2), 1:(dy/2)], 
	main="wave #1 + #2 + 5*noise", theta=90, phi=-110, ticktype="detailed", col="lightblue")

image(x=1:dim(a1)[1] , y=1:dim(a1)[2], z=a1)
	box(); mtext("wave #1")
image(x=1:dim(a2)[1] , y=1:dim(a2)[2], z=a2) 
	box(); mtext("wave #2")
image(x=1:dim(a)[1] , y=1:dim(a)[2], z=a+0*noise)
	box(); mtext("wave #1 + #2 ")
image(x=1:dim(a)[1] , y=1:dim(a)[2], z=a+7*noise)
	box(); mtext("wave #1 + #2 + 7*noise")

rc0 <- kz.rc2(a+0*noise, angle=c(q1,q2)*180/pi,f=c(f1,f2), m = 50, avg=FALSE)
cor(as.vector(a[1:dim(rc0)[1],1:dim(rc0)[2]]), as.vector(rc0), use="pairwise.complete.obs")

rc0 <- kz.rc2(a+0*noise, angle=c(q1,q2)*180/pi,f=c(f1,f2), m = 50, avg=TRUE, rlvl=15)
cor(as.vector(a[1:dim(rc0)[1],1:dim(rc0)[2]]), as.vector(rc0), use="pairwise.complete.obs")

rc <- kz.rc2(a+7*noise, angle=c(q1,q2)*180/pi,f=c(f1,f2), m = 50, avg=TRUE, rlvl=15, plot=TRUE)
cor(as.vector(a[1:dim(rc)[1],1:dim(rc)[2]]), as.vector(rc), use="pairwise.complete.obs")
dev.new();image(x=1:dim(rc)[1] , y=1:dim(rc)[2], z=a[1:dim(rc)[1],1:dim(rc)[2]])
box();title("Signal without noise")

rc <- kz.rc2(a+7*noise, angle=q2*180/pi, f=f2, m = 50, avg=TRUE, rlvl=21, plot=TRUE)
cor(as.vector(a2[1:dim(rc)[1],1:dim(rc)[2]]), as.vector(rc), use="pairwise.complete.obs")
dev.new();image(x=1:dim(rc)[1] , y=1:dim(rc)[2], z=a2[1:dim(rc)[1],1:dim(rc)[2]])
box();title("Signal without noise")




