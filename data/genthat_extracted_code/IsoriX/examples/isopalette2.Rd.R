library(IsoriX)


### Name: isopalette2
### Title: Colour palettes for plotting
### Aliases: isopalette2 isopalette1
### Keywords: color datasets

### ** Examples


## A comparison of some colour palette

par(mfrow = c(2, 3))
pie(rep(1, length(isopalette1)), col = isopalette1,
    border = NA, labels = NA, clockwise = TRUE, main = "isopalette1")
pie(rep(1, length(isopalette2)), col = isopalette2,
    border = NA, labels = NA, clockwise = TRUE, main = "isopalette2")
pie(rep(1, 100), col = terrain.colors(100), border = NA, labels = NA,
    clockwise = TRUE, main = "terrain.colors")
pie(rep(1, 100), col = rainbow(100), border = NA, labels = NA,
    clockwise = TRUE, main = "rainbow")
pie(rep(1, 100), col = topo.colors(100), border = NA, labels = NA,
    clockwise = TRUE, main = "topo.colors")
pie(rep(1, 100), col = heat.colors(100), border = NA, labels = NA,
    clockwise = TRUE, main = "heat.colors")

## Creating your own colour palette
MyPalette <- colorRampPalette(c("blue", "green", "red"), bias = 0.7)
par(mfrow = c(1, 1))
pie(1:100, col = MyPalette(100), border = NA, labels = NA,
    clockwise = TRUE, main = "a home-made palette")

## Turing palettes into functions for use in IsoriX
Isopalette1Fn <- colorRampPalette(isopalette1, bias = 0.5)
Isopalette2Fn <- colorRampPalette(isopalette2, bias = 0.5)
par(mfrow = c(1, 2))
pie(1:100, col = Isopalette1Fn(100), border = NA, labels = NA,
    clockwise = TRUE, main = "isopalette1")
pie(1:100, col = Isopalette2Fn(100), border = NA, labels = NA,
    clockwise = TRUE, main = "isopalette2")




