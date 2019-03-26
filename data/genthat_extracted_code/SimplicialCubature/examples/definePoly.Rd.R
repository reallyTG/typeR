library(SimplicialCubature)


### Name: definePoly
### Title: Define, evaluate, or print a polynomial
### Aliases: definePoly evalPoly printPoly

### ** Examples

p1 <- definePoly( c(3,5), matrix(c(3,0,0,0, 0,2,1,4), nrow=2, ncol=4, byrow=TRUE ) )
printPoly(p1)
evalPoly( c(1,3,1,2) , p1 ) # f(1,3,1,2) = 723





