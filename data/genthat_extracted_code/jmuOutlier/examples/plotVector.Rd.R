library(jmuOutlier)


### Name: plotVector
### Title: Plotting Vector Addition
### Aliases: plotVector
### Keywords: Vector

### ** Examples

# Vectors (2,8) and (4,-3) and their vector sum.
     plotVector( 2, 8, 4, -3 ) 
     
# Colinear vectors (-3,6) and (-1,2).
     plotVector( -3, 6, -1, 2, add=FALSE, col=c("red","black") )

# Colinear vectors (-1,2) and (3,-6).
     plotVector( -1, 2, 3, -6, add=FALSE )

# Vectors (2,3) and (5,-4)
     plotVector( 2, 3, 5, -4, add=FALSE, usr=c( -5, 5, -4, 7) )

# Vectors (2,3) and (-5,4) and their vector sum.
     plotVector( 2, 3, -5, 4, usr=c( -5, 5, -4, 7 ) )



