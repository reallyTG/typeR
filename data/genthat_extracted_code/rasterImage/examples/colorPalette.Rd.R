library(rasterImage)


### Name: colorPalette
### Title: Defines a color palette
### Aliases: colorPalette

### ** Examples

# default "spectral" palette
barplot(rep(1,10), col = colorPalette(10))

# custom color palette
barplot(rep(1,10), col = colorPalette(n = 10, type = c("red","blue","yellow")))



