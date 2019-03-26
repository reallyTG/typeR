library(ifultools)


### Name: autoKey
### Title: Automatic key placement
### Aliases: autoKey
### Keywords: hplot

### ** Examples

zkey <- list(x=-1,y=-1,
lines=list(type=c("o","l"), pch=c(18,0), lty=1, col=1:2),
border=1,
corner=c(1,1),
cex=1.5 )

old.mfrow <- par(mfrow=c(2,2))

## rectangular hole in cloud 
set.seed(100)
N <- 10024
y <- rnorm(N)
x <- seq(N)
xhole <- x > .4*N & x < .9*N
yhole <- y > -2 & y < 2
hole  <- xhole & yhole
y <- y[!hole]
x <- x[!hole]
plot(x, y, type="p")
autoKey(x, y, args=zkey)

## linear chirp (more room on left) 
y <- sin(.125*pi*100*((0:99)/100)^2)
plot(y, type="p")
autoKey(y, args=zkey)

## quadratic 
x <- seq(-5,5)
y <- x^2
plot(x,y,type="p")
autoKey(x, y, args=zkey)

## circle 
tt <- seq(0,2*pi,length=100)
x  <- sin(tt)
y  <- cos(tt)
plot(x, y, type="p")
autoKey(x, y, args=zkey)
par(old.mfrow)



