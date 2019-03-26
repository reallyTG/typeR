library(IDPmisc)


### Name: iplotLegend
### Title: Plots Legend for Color Ramp
### Aliases: iplotLegend
### Keywords: hplot

### ** Examples

## Not run: 
##D par(oma = rep(2, 4))
##D layout(matrix(c(1, 2), ncol = 2),
##D       width = c(lcm(par("csi")*5*2.54), 1),
##D       heights = 1)
## End(Not run)
iplotLegend(IDPcolorRamp, ncol = 15)



