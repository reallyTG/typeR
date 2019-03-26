library(fda)


### Name: create.polygonal.basis
### Title: Create a Polygonal Basis
### Aliases: create.polygonal.basis
### Keywords: smooth

### ** Examples

#  Create a polygonal basis over the interval [0,1]
#  with break points at 0, 0.1, ..., 0.95, 1
(basisobj <- create.polygonal.basis(seq(0,1,0.1)))
#  plot the basis
plot(basisobj)



