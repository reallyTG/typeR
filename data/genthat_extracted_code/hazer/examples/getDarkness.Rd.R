library(hazer)


### Name: getDarkness
### Title: The darkness map of an image (0 to 1).
### Aliases: getDarkness

### ** Examples

library(jpeg)

img <- readJPEG(system.file("img", "Rlogo.jpg", package="jpeg"))

d <- getDarkness(img)

par(mfrow=c(2,1), mar = c(0.5, 1, 0.5, 1))

plotRGBArray(img)
plotRGBArray(d)



