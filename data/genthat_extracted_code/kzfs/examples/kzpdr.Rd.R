library(kzfs)


### Name: kzpdr
### Title: Average Periodogram for Spatial Data in Given Directions
### Aliases: kzpdr kzpdr.3d
### Keywords: directional-periodogram

### ** Examples

dx <- 300			 
dy <- 300			 

b <- expand.grid(x=1:dx, y=1:dy)
q1 <- pi/3; f1 <- 0.2;
b$v1 <- sin(f1*2*pi*(b$x*cos(q1)+b$y*sin(q1))+100*runif(1))
q2 <- pi/6; f2 <- 0.05;
b$v2 <- sin(f2*2*pi*(b$x*cos(q2)+b$y*sin(q2))+100*runif(1))

a <- array(0,c(dx,dy))
a[as.matrix(b[,1:2])] <- b$v1 + 1.5*b$v2
persp(1:dx, 1:dy, a, theta=90, phi=-110, 
	ticktype="detailed", col="lightblue")
a <- a + 5*matrix(rnorm(dx*dy,0,1),ncol=dy)
persp(1:dx, 1:dy, a, theta=90, phi=-110, 
	ticktype="detailed", col="lightblue")

# It may take about 30 seconds
# o <- kzpdr.3d(a, -pi/6) 

# Load pre-saved data to save running-time
data(kzpdr.demo);

# sampling, it may take a few minutes 
# system.time(kzpdr.demo <- kzpdr(a, pi/12, pair=FALSE, plot=TRUE)) 
# system.time(kzpdr.demo <- kzpdr(a, pi/12, plot=TRUE))
# system.time(kzpdr.demo <- kzpdr(a, c(0, pi/6, pi/4, pi/3), plot=TRUE))
 
kzpdr.spikes(kzpdr.demo)

# For identification of the wave parameters, see kzpdr.estimate



