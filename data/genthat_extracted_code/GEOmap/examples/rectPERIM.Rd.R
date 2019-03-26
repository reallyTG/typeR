library(GEOmap)


### Name: rectPERIM
### Title: Extract a rectangular perimeter
### Aliases: rectPERIM
### Keywords: misc

### ** Examples


fx  =rnorm(20)
fy = rnorm(20)

plot(fx, fy, xlim=c(-4, 4), ylim=c(-4,4))
rp = rectPERIM(fx, fy)

polygon(rp)
text(rp, labels=1:4, pos=c(1,1,3,3), font=2, cex=2)


fx2  =rnorm(20, m=-1)
fy2 = rnorm(20, m=-1)

Fx = list(x=fx2, y=fy2)

points(Fx$x, Fx$y, col='red')

rp = rectPERIM(Fx)

polygon(rp, border='red')


########   try expanding the perim:

plot(fx, fy, xlim=c(-4, 4), ylim=c(-4,4), asp=1)
rp = rectPERIM(fx, fy, pct=0.1)

polygon(rp)

rp = rectPERIM(fx, fy, pct=0.2)

polygon(rp)






