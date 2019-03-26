library(adehabitatLT)


### Name: indmove
### Title: Testing Independence in Regular Trajectory Parameters
### Aliases: indmove indmove.detail testang.ltraj testdist.ltraj
### Keywords: htest

### ** Examples

## Not run: 
##D ## theoretical independence between
##D br <- simm.brown(1:1000)
##D testang.ltraj(br)
##D testdist.ltraj(br)
##D 
##D indmove(br)
## End(Not run)

## Illustration of the statistic used for the test of the independence
## of the angles
opar <- par(mar = c(0,0,4,0))
plot(0,0, asp=1, xlim=c(-1, 1), ylim=c(-1, 1), ty="n", axes=FALSE,
main="Criteria f for the measure of independence between successive
angles at time i-1 and i") 
box()
symbols(0,0,circle=1, inches=FALSE, lwd=2, add=TRUE)
abline(h=0, v=0)
x <- c( cos(pi/3), cos(pi/2 + pi/4))
y <- c( sin(pi/3), sin(pi/2 + pi/4))
arrows(c(0,0), c(0,0), x, y)
lines(x,y, lwd=2, col="red")
text(0, 0.9, expression(f^2 == 2*sum((1 - cos(alpha[i]-alpha[i-1])),
i==1, n-1)), col="red")
foo <- function(t, alpha)
{
  xa <- sapply(seq(0, alpha, length=20), function(x) t*cos(x))
  ya <- sapply(seq(0, alpha, length=20), function(x) t*sin(x))
  lines(xa, ya)
}
foo(0.3, pi/3)
foo(0.1, pi/2 + pi/4)
foo(0.11, pi/2 + pi/4)
text(0.34,0.18,expression(alpha[i]), cex=1.5)
text(0.15,0.11,expression(alpha[i-1]), cex=1.5)
par(opar)



