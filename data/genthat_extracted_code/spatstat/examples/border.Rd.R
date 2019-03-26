library(spatstat)


### Name: border
### Title: Border Region of a Window
### Aliases: border
### Keywords: spatial math

### ** Examples

# rectangle
   u <- unit.square()
   border(u, 0.1)
   border(u, 0.1, outside=TRUE)
# polygon
   ## Don't show: 
opa <- spatstat.options(npixel=32)
## End(Don't show)
   data(letterR)
   plot(letterR)
   plot(border(letterR, 0.1), add=TRUE)
   plot(border(letterR, 0.1, outside=TRUE), add=TRUE)
   ## Don't show: 
spatstat.options(opa)
## End(Don't show)



