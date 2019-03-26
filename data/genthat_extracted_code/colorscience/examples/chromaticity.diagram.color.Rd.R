library(colorscience)


### Name: chromaticity.diagram.color
### Title: Plot the chromaticity diagram line with color
### Aliases: chromaticity.diagram.color chromaticity.diagram.color.fill
### Keywords: datasets

### ** Examples

chromaticity.diagram.color()
xl<-yl<-0:1
chromaticity.diagram.color(xlim=xl,ylim=yl)
chromaticity.diagram.color(conversionFunction=CIE1931XYZ2CIE1976uv, xlim=xl,
ylim=yl,xlab="u'",ylab="v'")



