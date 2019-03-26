library(gstat)


### Name: image
### Title: Image Gridded Coordinates in Data Frame
### Aliases: image.data.frame image xyz2img
### Keywords: dplot

### ** Examples

library(sp)
data(meuse)
data(meuse.grid)
g <- gstat(formula=log(zinc)~1,locations=~x+y,data=meuse,model=vgm(1,"Exp",300))
x <- predict(g, meuse.grid)
image(x, 4, main="kriging variance and data points")
points(meuse$x, meuse$y, pch = "+")
# non-square cell test:
image(x[((x$y - 20) %% 80) == 0,], main = "40 x 80 cells")
image(x[((x$x - 20) %% 80) == 0,], main = "80 x 40 cells")
# the following works for square cells only:
oldpin <- par("pin")
ratio <- length(unique(x$x))/length(unique(x$y))
par(pin = c(oldpin[2]*ratio,oldpin[2]))
image(x, main="Exactly square cells, using par(pin)")
par(pin = oldpin)
library(lattice)
levelplot(var1.var~x+y, x, aspect = "iso", main = "kriging variance")



