library(hazer)


### Name: getHazeFactor
### Title: The haze factor for a given RGB array.
### Aliases: getHazeFactor

### ** Examples

library(jpeg)

img <- readJPEG(system.file("img", "Rlogo.jpg", package="jpeg"))

h <- getHazeFactor(img)
d <- getDarkness(img)
b <- getBrightness(img)
c <- getContrast(img)

par(mfcol = c(2, 2), mar = c(0.5, 0.5, 0.5, 0.5))

plotRGBArray(img)
mtext(text = 'RGB', side = 3, line = -2, adj = 0.05, font = 2, col = 'red')
mtext(text = paste0('Hazeness: ', signif(h$haze, 2)), side = 1, line = -2, adj = 0.05)
mtext(text = paste0('A0: ', signif(h$A0, 2)), side = 1, line = -1, adj = 0.05)

plotRGBArray(d)
mtext(text = 'Darkness', side = 3, line = -2, adj = 0.05, font = 2, col = 'red')

plotRGBArray(b)
mtext(text = 'Brightness', side = 3, line = -2, adj = 0.05, font = 2, col = 'red')

plotRGBArray(c)
mtext(text = 'Contrast', side = 3, line = -2, adj = 0.05, font = 2, col = 'red')




