library(plotrix)


### Name: radialtext
### Title: Display text in a radial line
### Aliases: radialtext
### Keywords: misc

### ** Examples

 plot(0, xlim=c(1,5), ylim=c(1,5), main="Test of radialtext",
  xlab="", ylab="", type="n")
 points(3, 3, pch=20)
 radialtext("uncooked spaghetti", center=c(3,3),
  col="blue")
 radialtext("uncooked spaghetti", center=c(3,3),
  start=1.2, angle=pi/4, cex=0.8)
 radialtext("uncooked spaghetti", center=c(3,3),
  middle=1.2, angle=pi/4+0.1, cex=0.8)
 radialtext("uncooked spaghetti", center=c(3,3),
  end=1.2, angle=pi/4+0.2, cex=0.8)
 radialtext("uncooked spaghetti", center=c(3,3),
  start=0.5, deg=135, cex=0.8, col="green")
 radialtext("uncooked spaghetti", center=c(3,3),
  start=0.5, deg=145, cex=0.8, stretch=2)
 radialtext("uncooked spaghetti", center=c(3,3),
  start=0.5, deg=20, expand=0, col="red")
 radialtext("uncooked spaghetti", center=c(3,3),
  start=0.5, deg=250, expand=0.35)
 radialtext("uncooked spaghetti", center=c(3,3),
  start=0.75, deg=225, expand=1, col="gold")
 radialtext("uncooked spaghetti", center=c(3,3),
  start=0.5, deg=325, expand=-0.25, cex=2)



