library(oompaBase)


### Name: ColorCoding-class
### Title: Class "ColorCoding"
### Aliases: ColorCoding-class ColorCoding colorCode
### Keywords: classes color

### ** Examples

showClass("ColorCoding")

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

## cleanup
rm(x, y, xp, yp, theta, colors, fac)

colorList <- c(oompaColor$BORING, oompaColor$SIGNIFICANT,
               oompaColor$EXPECTED, oompaColor$OBSERVED,
               oompaColor$PERMTEST, oompaColor$FITTED,
               oompaColor$CENTRAL.LINE, oompaColor$CONFIDENCE.CURVE,
               oompaColor$BAD.REPLICATE, oompaColor$WORST.REPLICATE,
               oompaColor$FOLD.DIFFERENCE, oompaColor$BAD.REPLICATE.RATIO,
               oompaColor$TOP.TEN, oompaColor$BOTTOM.TEN,
               oompaColor$TOP.TEN.SOLO, oompaColor$BOTTOM.TEN.SOLO
               )
plot(c(1,4), c(1,4), type='n')
for (i in 1:4) {
  for (j in 1:4) {
    points(i,j, col=colorList[i + 4*(j-1)], pch=16, cex=4)
  }
}
rm(colorList, i, j)



