library(rgl)


### Name: rgl.postscript
### Title: export screenshot
### Aliases: rgl.postscript
### Keywords: dynamic

### ** Examples


x <- y <- seq(-10, 10, length = 20)
z <- outer(x, y, function(x, y) x^2 + y^2)
persp3d(x, y, z, col = 'lightblue')

title3d("Using LaTeX text", col = 'red', line = 3)
rgl.postscript("persp3da.ps", "ps", drawText = FALSE)
rgl.postscript("persp3da.pdf", "pdf", drawText = FALSE)
rgl.postscript("persp3da.tex", "tex")
rgl.pop()
title3d("Using ps/pdf text", col = 'red', line = 3)
rgl.postscript("persp3db.ps", "ps")
rgl.postscript("persp3db.pdf", "pdf")
rgl.postscript("persp3db.tex", "tex", drawText = FALSE)

## Not run: 
##D 
##D #
##D # create a series of frames for an animation
##D #
##D 
##D rgl.open()
##D shade3d(oh3d(), color = "red")
##D rgl.viewpoint(0, 20)
##D 
##D for (i in 1:45) {
##D   rgl.viewpoint(i, 20)
##D   filename <- paste("pic", formatC(i, digits = 1, flag = "0"), ".eps", sep = "") 
##D   rgl.postscript(filename, fmt = "eps")
##D }
##D 
## End(Not run)




