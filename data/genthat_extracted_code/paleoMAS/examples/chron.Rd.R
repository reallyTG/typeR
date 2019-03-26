library(paleoMAS)


### Name: chron
### Title: Age-depth computation
### Aliases: chron
### Keywords: manip chron arith math

### ** Examples

data(quexilchron,quexildepths)
#linear interpolation
chron(quexilchron,quexildepths,max.depth=1957,dates="points")
# Spline estimation
chron(quexilchron,quexildepths,max.depth=1957,dates="points")




