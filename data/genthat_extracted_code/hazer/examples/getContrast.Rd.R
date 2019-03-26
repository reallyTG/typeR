library(hazer)


### Name: getContrast
### Title: The contrast map of an image (0 to 1).
### Aliases: getContrast

### ** Examples

library(jpeg)

img <- readJPEG(system.file("img", "Rlogo.jpg", package="jpeg"))

c <- getContrast(img)

par(mfrow=c(2,1), mar = c(0.5, 1, 0.5, 1))

plotRGBArray(img)
plotRGBArray(c)



