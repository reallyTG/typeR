library(DescTools)


### Name: DrawCircle
### Title: Draw a Circle
### Aliases: DrawCircle
### Keywords: aplot

### ** Examples

Canvas(xlim = c(-5,5), xpd=TRUE)
cols <- Pal("Helsana")[1:4]

# Draw ring
DrawCircle (r.in = 1, r.out = 5, border="darkgrey", col=SetAlpha(hyellow, 0.2), lwd=2)

# Draw circle
DrawCircle (r.in = 6, border=hgreen, lwd=3)

# Draw sectors
geom <- rbind(c(-pi, 0, .25, .5), c(0, pi, 1, 2),
              c(-pi/2, pi/2, 2, 2.5), c(pi/2, 3 * pi/2, 3, 4),
              c(pi - pi/8, pi + pi/8, 1.5, 2.5))

DrawCircle (r.in = geom[,3], r.out = geom[,4],
           theta.1 = geom[,1], theta.2 = geom[,2],
           col = SetAlpha(cols, 0.6),
           border = cols, lwd=1)


# clipping
Canvas(bg="lightgrey", main="Yin ~ Yang")
DrawCircle (r.out = 1, col="white")
clip(0, 2, 2, -2)
DrawCircle(col="black")
clip(-2, 2, 2, -2)
DrawCircle (y = c(-0.5,0.5), r.out = 0.5, col=c("black", "white"), border=NA)
DrawCircle (y = c(-0.5,0.5), r.out = 0.1, col=c("white", "black"), border=NA)
DrawCircle ()


# overplotting circles
Canvas(xlim=c(-5,5))
DrawCircle (r.out=4:1, col=c("white", "steelblue2", "white", "red"), lwd=3, nv=300)


# rotation
x <- seq(-3, 3, length.out=10)
y <- rep(0, length.out=length(x))

Canvas(xlim=c(-5,5), bg="black")

sapply( (0:11) * pi/6, function(theta) {
  xy <- Rotate(x, y=y, theta=theta)
  DrawCircle (x=xy$x, y=xy$y, r.in=2.4, border=SetAlpha("white", 0.2))
} )



