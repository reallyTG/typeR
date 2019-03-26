library(colorscience)


### Name: chromaticity.diagram
### Title: Plot the chromaticity diagram
### Aliases: chromaticity.diagram
### Keywords: datasets

### ** Examples

chromaticity.diagram()
xl<-yl<-0:1
chromaticity.diagram(xlim=xl,ylim=yl)
chromaticity.diagram(conversionFunction=CIE1931XYZ2CIE1976uv, xlim=xl,ylim=yl,
xlab="u'",ylab="v'")



