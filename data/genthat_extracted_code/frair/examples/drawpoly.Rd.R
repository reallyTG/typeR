library(frair)


### Name: drawpoly
### Title: Draw polygons
### Aliases: drawpoly drawpoly.default

### ** Examples

datx <- 1:6
upper <- datx*1.2
lower <- datx*0.8
plot(datx, datx, type='n', ylim=c(0,10), xlab='X', ylab='Y')
drawpoly(datx, upper, lower, col=2)
points(datx, datx, pch=20)



