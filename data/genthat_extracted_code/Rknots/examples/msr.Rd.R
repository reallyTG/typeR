library(Rknots)


### Name: msr
### Title: Minimal Structure Reduction
### Aliases: msr
### Keywords: structurereduction

### ** Examples

## Not run: 
##D knot <- makeExampleKnot()
##D reduced <- msr(points3D = knot)
##D 
##D ## 3D plot of both the trefoil and its reduced structure
##D plotKnot3D(knot, ends = c(), radius = 0.01, lwd = 2.5)
##D plotKnot3D(reduced$points3D, reduced$ends, colors = 'red', radius = 0.1, lwd = 2.5)
## End(Not run)



