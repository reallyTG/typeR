library(rtiff)


### Name: newPixmapRGB
### Title: Create an RGB pixmap
### Aliases: newPixmapRGB
### Keywords: utilities

### ** Examples


#this is tautological, but demonstrates the syntax...
tif <- readTiff(system.file("tiff", "jello.tif", package="rtiff"))
myPixmap <- newPixmapRGB(tif@red, tif@green, tif@blue)
plot(myPixmap)

#let's scramble the color channels just for fun

getOption("device")()
myPixmap <- newPixmapRGB(tif@blue, tif@red, tif@green)
plot(myPixmap)




