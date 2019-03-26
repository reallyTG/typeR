library(OpenRepGrid)


### Name: doRectanglesOverlap
### Title: Detect if two rectangles overlap.
### Aliases: doRectanglesOverlap
### Keywords: internal

### ** Examples

## Not run: 
##D   #overlap in x and y
##D   a <- c(0,0,2,2)
##D   b <- c(1,1,4,3)
##D   plot(c(a,b), c(a,b), type="n")
##D   rect(a[1], a[2], a[3], a[4])
##D   rect(b[1], b[2], b[3], b[4])
##D   doRectanglesOverlap(a,b)
##D 
##D   # b contained in a vertically
##D   a <- c(5,0,20,20)
##D   b <- c(0, 5,15,15)
##D   plot(c(a,b), c(a,b), type="n")
##D   rect(a[1], a[2], a[3], a[4])
##D   rect(b[1], b[2], b[3], b[4])
##D   doRectanglesOverlap(a,b)
##D 
##D   # overlap only in y
##D   a <- c(0,0,2,2)
##D   b <- c(2.1,1,4,3)
##D   plot(c(a,b), c(a,b), type="n")
##D   rect(a[1], a[2], a[3], a[4])
##D   rect(b[1], b[2], b[3], b[4])
##D   doRectanglesOverlap(a,b)
## End(Not run)




