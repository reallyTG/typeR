library(colorscience)


### Name: Maxwell.triangle
### Title: Plot the Maxwell triangle
### Aliases: Maxwell.triangle Maxwell.triangle.color
###   Maxwell.triangle.color.fill
### Keywords: datasets

### ** Examples

Maxwell.triangle()
xl<-yl<-0:1
Maxwell.triangle(xlim=xl,ylim=yl)
Maxwell.triangle(conversionFunction=CIE1931XYZ2CIE1976uv, 
xlim=xl,ylim=yl,xlab="u'",ylab="v'")



