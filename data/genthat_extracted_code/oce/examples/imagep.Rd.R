library(oce)


### Name: imagep
### Title: Plot an Image with a Color Palette
### Aliases: imagep

### ** Examples

library(oce)

# 1. simplest use
imagep(volcano)

# 2. something oceanographic (internal-wave speed)
h <- seq(0, 50, length.out=100)
drho <- seq(1, 3, length.out=200)
speed <- outer(h, drho, function(drho, h) sqrt(9.8 * drho * h / 1024))
imagep(h, drho, speed, xlab="Equivalent depth [m]",
ylab=expression(paste(Delta*rho, " [kg/m^3]")),
zlab="Internal-wave speed [m/s]")

# 3. fancy labelling on atan() function
x <- seq(0, 1, 0.01)
y <- seq(0, 1, 0.01)
angle <- outer(x,y,function(x,y) atan2(y,x))
imagep(x, y, angle, filledContour=TRUE, breaks=c(0, pi/4, pi/2),
       col=c("lightgray", "darkgray"),
       at=c(0, pi/4, pi/2),
       labels=c(0, expression(pi/4), expression(pi/2)))

# 4. a colormap case
data(topoWorld)
cm <- colormap(name="gmt_globe")
imagep(topoWorld, colormap=cm)




