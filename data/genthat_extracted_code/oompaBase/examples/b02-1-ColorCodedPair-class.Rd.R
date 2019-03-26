library(oompaBase)


### Name: ColorCodedPair-class
### Title: Class "ColorCodedPair"
### Aliases: ColorCodedPair-class ColorCodedPair
###   plot,ColorCodedPair,missing-method
### Keywords: classes color

### ** Examples

showClass("ColorCodedPair")

theta <- (0:360)*pi/180
x <- cos(theta)
y <- sin(theta)
xp <- x > 0
yp <- y > 0
colors <- list(ColorCoding(xp&yp, oompaColor$EXPECTED),
               ColorCoding(xp&!yp, oompaColor$OBSERVED),
               ColorCoding(!xp&yp, oompaColor$PERMTEST),
               ColorCoding(!xp&!yp, oompaColor$FITTED))
plot(ColorCodedPair(x, y, colors))

plot(ColorCodedPair(theta, x, colors))

plot(ColorCodedPair(theta, y, colors),
     xlab='angle in radians', ylab='sine', main='colored sine')




