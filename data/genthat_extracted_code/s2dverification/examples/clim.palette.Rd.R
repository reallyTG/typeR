library(s2dverification)


### Name: clim.palette
### Title: Generate Climate Color Palettes
### Aliases: clim.colors clim.palette
### Keywords: datagen

### ** Examples

lims <- seq(-1, 1, length.out = 21)

ColorBar(lims, color_fun = clim.palette('redyellow'))

cols <- clim.colors(20)
ColorBar(lims, cols)



