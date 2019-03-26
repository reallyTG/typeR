library(hyperSpec)


### Name: matlab.palette
### Title: Matlab-like Palettes Two palettes going from blue over green to
###   red, approximately as the standard palette of Matlab does. The second
###   one has darker green values and is better suited for plotting lines
###   on white background.
### Aliases: matlab.palette matlab.dark.palette alois.palette
### Keywords: color

### ** Examples


plotmap (chondro [,, 778], col.regions = matlab.palette ())


plot (flu, col = matlab.dark.palette (nrow (flu)))

plotmap (chondro, col = alois.palette)



