library(spatstat)


### Name: runifpoint
### Title: Generate N Uniform Random Points
### Aliases: runifpoint
### Keywords: spatial datagen

### ** Examples

 # 100 random points in the unit square
 pp <- runifpoint(100)
 # irregular window
 data(letterR)
 # polygonal
 pp <- runifpoint(100, letterR)
 # binary image mask
 pp <- runifpoint(100, as.mask(letterR))
 ##
 # randomising an existing point pattern
 runifpoint(npoints(cells), win=Window(cells))
 runifpoint(ex=cells)



