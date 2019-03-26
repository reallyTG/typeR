library(fdrtool)


### Name: gcmlcm
### Title: Greatest Convex Minorant and Least Concave Majorant
### Aliases: gcmlcm
### Keywords: smooth

### ** Examples

# load "fdrtool" library
library("fdrtool")

# generate some data
x = 1:20
y = rexp(20)
plot(x, y, type="l", lty=3, main="GCM (red) and LCM (blue)")
points(x, y)

# greatest convex minorant (red)
gg = gcmlcm(x,y)
lines(gg$x.knots, gg$y.knots, col=2, lwd=2)

# least concave majorant (blue)
ll = gcmlcm(x,y, type="lcm")
lines(ll$x.knots, ll$y.knots, col=4, lwd=2)




