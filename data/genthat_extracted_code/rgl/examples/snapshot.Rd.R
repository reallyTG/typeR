library(rgl)


### Name: rgl.snapshot
### Title: export screenshot
### Aliases: rgl.snapshot snapshot3d
### Keywords: dynamic

### ** Examples


## Not run: 
##D 
##D #
##D # create animation
##D #
##D 
##D shade3d(oh3d(), color = "red")
##D rgl.bringtotop()
##D rgl.viewpoint(0, 20)
##D 
##D olddir <- setwd(tempdir())
##D for (i in 1:45) {
##D   rgl.viewpoint(i, 20)
##D   filename <- paste("pic", formatC(i, digits = 1, flag = "0"), ".png", sep = "")
##D   rgl.snapshot(filename)
##D }
##D ## Now run ImageMagick in tempdir().  Use 'convert' instead of 'magick'
##D ## if you have an older version of ImageMagick:
##D ##    magick -delay 10 *.png -loop 0 pic.gif
##D setwd(olddir)
## End(Not run)




