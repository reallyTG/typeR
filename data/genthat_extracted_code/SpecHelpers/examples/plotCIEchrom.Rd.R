library(SpecHelpers)


### Name: plotCIEchrom
### Title: Draw the 1931 CIE chromaticity diagram
### Aliases: plotCIEchrom
### Keywords: hplot

### ** Examples

require("grid")
plotCIEchrom() # no gradient
## These are a too slow for CRAN checks:
## Not run: 
##D plotCIEchrom(gradient = "sl") # basic plot
##D # Notice there is not much yellow in that plot.  Increase
##D # the exposure to bring in some yellow, at the expense of some blues:
##D plotCIEchrom(gradient = "sl", ex = 1.4)
##D # Next show a gradient for the CMYK printing process
##D # and outline the colors a typical monitor can display.
##D plotCIEchrom(gradient = getGamutValues("SWOP"), opts = c("D65", "SWOP", "sRGB"))
## End(Not run)



