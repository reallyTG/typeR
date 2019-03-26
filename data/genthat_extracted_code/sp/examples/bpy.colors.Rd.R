library(sp)


### Name: bpy.colors
### Title: blue-pink-yellow color scheme, which also prints well on
###   black/white printers
### Aliases: bpy.colors
### Keywords: color

### ** Examples

bpy.colors(10)
p <- expand.grid(x=1:30,y=1:30)
p$z <- p$x + p$y
coordinates(p) <- c("x", "y")
gridded(p) <- TRUE
image(p, col = bpy.colors(100), asp = 1)
# require(lattice)
# trellis.par.set("regions", list(col=bpy.colors())) # make this default pallette



