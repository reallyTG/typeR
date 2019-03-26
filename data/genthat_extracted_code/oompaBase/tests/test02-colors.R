# colors-test.ssc
library(oompaBase)

xc <- new("ColorCoding")
xc

xc <- new("ColorCoding", v=TRUE, mark=17)
xc

theta <- (0:360)*pi/180
x <- cos(theta)
y <- sin(theta)
xp <- x > 0
yp <- y > 0
colors <- list(ColorCoding(xp&yp, oompaColor$BORING),
               ColorCoding(xp&!yp, oompaColor$TOP.TEN),
               ColorCoding(!xp&yp, oompaColor$BOTTOM.TEN),
               ColorCoding(!xp&!yp, oompaColor$CONFIDENCE.CURVE))
plot(ColorCodedPair(x, y, colors))

plot(ColorCodedPair(theta, x, colors))

plot(ColorCodedPair(theta, y, colors),
     xlab='angle in radians', ylab='sine', main='colored sine')

fac <- factor(rep(c('left', 'right'), c(180, 181)))
colors <- colorCode(fac, c('blue', 'red'))
plot(ColorCodedPair(x, y, colors))

# cleanup
rm(x, y, xp, yp, theta, colors, fac)

plot(c(1,4), c(1,4), type='n')
for (i in 1:4) {
  for (j in 1:4) {
    points(i,j, col=oompaColor[[i + 4*(j-1)]], pch=16, cex=4)
  }
}
rm(i, j)
