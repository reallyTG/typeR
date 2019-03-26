library(plotrix)


### Name: draw.arc
### Title: Draw arc
### Aliases: draw.arc
### Keywords: misc

### ** Examples


   plot(1:10, asp = 1,main="Test draw.arc")
   draw.arc(5, 5, 1:10/10, deg2 = 1:10*10, col = "blue")
   draw.arc(8, 8, 1:10/10, deg2 = 1:10*10, col = 1:10)
   draw.arc(5, 5, 3, deg1=100, deg2=170, col="gold", lwd=50, lend=1)
   # example taken from post by Hans Borcher:
   # https://stat.ethz.ch/pipermail/r-help/2009-July/205728.html
   # Note setting of aspect ratio to 1 first.
   curve(sin(x), 0, pi, col="blue", asp=1)
   draw.arc(pi/2, 0, 1, deg1=45, deg2=135, col="red")




