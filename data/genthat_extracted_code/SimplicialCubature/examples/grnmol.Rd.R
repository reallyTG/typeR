library(SimplicialCubature)


### Name: grnmol
### Title: Grundmann-Moller integration of a function over a simplex
### Aliases: grnmol

### ** Examples

f <- function( x ) { x[1]^2*x[4]^5 }
grnmol( f, CanonicalSimplex(4), s=4 )




