library(plotfunctions)


### Name: drawDevArrows
### Title: Draw arrows between different plots.
### Aliases: drawDevArrows

### ** Examples


### EXAMPLE 1 ################################

# setup 4 panels:
par(mfrow=c(2,2))

#------------------
# PLOT 1: two points
#------------------

plot(0.5, 0.5, main="1", 
	pch=21, lwd=3, col='red', bg='white', cex=1.2)
points(.5, .375, pch=22, lwd=3, col="blue", cex=1.2)

# Draw an error between the two points:
drawDevArrows(start=c(.5,.5), end=c(.5,.375), 
	units="coords", arrows="start", length=.1, lty=1)
# ... which is the same as using arrows:
arrows(x0=.5, x1=.5, y0=.5, y1=.375, code=1, length=.1, lty=1)

# ... but these arrows can also be clipped to the device 
# instead of the plot region (see leftbottom corner):
drawDevArrows(start=c(.5,.5), end=c(.5,.375), 
	units="dev", arrows="start", length=.1, lty=1)

# The function getArrowPos converts coordinates to device coordinates:
x1 <- getArrowPos(x=0.5, y=0.5, units="coords")
x2 <- getArrowPos(x=0.5, y=0.375, units="coords")
drawDevArrows(x1, x2, col="purple",
	arrows="start", length=.1, lty=2, lwd=2)


# Setup 4 arrows with the same starting points, 
# but defined differently:
a1 <- getArrowPos(x=0.5, y=0.375, units="coords")
a2 <- getArrowPos(x=0.5, y=0.21, units="prop")
a3 <- getArrowPos(x=0.55, y=0.36, units="prop", dev="fig")
a4 <- getArrowPos(x=0.5*0.55, y=.5*0.36+.5, units="prop", dev="dev")

# Setup 3 arrows with the same x and y values, 
# which define different starting points in practice:
b1 <- getArrowPos(x=.5, y=.5, units="prop", dev="plot")
b2 <- getArrowPos(x=.5, y=.5, units="prop", dev="fig")
b3 <- getArrowPos(x=.5, y=.5, units="prop", dev="dev")


#------------------
# PLOT 2: different coordinates
#------------------

plot(c(-2.33, 20), c(.3, .8), type='n', main='2')
points(15,.8, pch=21, lwd=3, col='red', bg='white', cex=1.2)

# define end point for b:
b <- getArrowPos(x=15, y=.8)

# Draw arrow b1:
drawDevArrows(start=b1, end=b, arrows="start", length=.1, lty=1)


#------------------
# PLOT 3: upside down axis
#------------------

emptyPlot(c(25, 1050), c(15,-15), eegAxis=TRUE, h0=0)
# plot line:
x <- 0:1000
y <- 10*cos(x/100)
lines(x, y, col=4)
# draw point points on gthe line:
x <- c(200,400,600,800)
y <- 10*cos(x/100)
points(x,y, pch=18)

# To avoid calling the function drawDevArrows 4 times, we rewrite
# the x- and y-positions of the 4 coordinates a1, a2, a3, a4 in one list:
a.start <- list(x=c(a1$x, a2$x, a3$x, a4$x), y=c(a1$y, a2$y, a3$y, a4$y))
# Define end points on the line:
a.end <- getArrowPos(x=x, y=y)
drawDevArrows(start=a.start, end=a.end, arrows="none", lty=3)

# Note that these four coordinates are actually referring 
# to the same starting point!
# So instead we could have written:
drawDevArrows(start=a1, end=a.end, arrows="none", col=alpha("red"), lwd=2)


#------------------
# PLOT 4: wrapping up
#------------------

# Arrows could be constructed when the plot is not yet called, 
# as they are clipped to the device:
drawDevArrows(start=c(0,7), end=c(7,0), col='gray', lwd=4, lty=3, arrows="none")

# Add the plot:
plot(1,1, bg="green")

# Finish b2 and b3: same x and y, but different coordinates
drawDevArrows(start=b2, end=b, arrows="start", length=.1, lty=2)
drawDevArrows(start=b3, end=b, arrows="start", length=.1, lty=3)



### EXAMPLE 2 ################################



# setup 4 plots:
par(mfrow=c(2,2))

n <- 50

#------------------
# PLOT 1: empty
#------------------


emptyPlot(c(25, 1050), c(15,-15), axes=FALSE)
lines(0:1000, 10*cos(0:1000/200), col=4)
x <- seq(0,1000, length=n)
y <- 10*cos(x/200)

a <- getArrowPos(x=x, y=y)


#------------------
# PLOT 2
#------------------

emptyPlot(c(25, 1050), c(15,-15), axes=FALSE)
lines(0:1000, 10*sin(0:1000/200), col=1)
x <- seq(0,1000, length=n)
y <- 10*sin(x/200)


b <- getArrowPos(x=x, y=y)



#------------------
# PLOT 3
#------------------

emptyPlot(c(25, 1050), c(15,-15), axes=FALSE)
lines(0:1000, 10*cos(0:1000/200), col=4)
x <- seq(0,1000, length=n)
y <- 10*cos(x/200)


c <- getArrowPos(x=rev(x), y=rev(y))


#------------------
# PLOT 4
#------------------

emptyPlot(c(25, 1050), c(15,-15), axes=FALSE)
lines(0:1000, 10*sin(0:1000/200), col=1)
x <- seq(0,1000, length=n)
y <- 10*sin(x/200)

d1 <- getArrowPos(x=rev(x), y=rev(y))
d2 <- getArrowPos(x=x, y=y)


#------------------
# DRAW ARROWS
#------------------

drawDevArrows(start=a, end=b, arrows="none", col='gray')
drawDevArrows(start=c, end=d1, arrows="none", col='gray')

drawDevArrows(start=a, end=c, arrows="none", 
    col=alphaPalette(c('green', 'blue'), f.seq=c(0,1), n=n))
drawDevArrows(start=b, end=d2, arrows="none", 
    col=alphaPalette('pink', f.seq=c(1,.1), n=n))



