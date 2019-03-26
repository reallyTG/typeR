library(fda)


### Name: polygpen
### Title: Polygonal Penalty Matrix
### Aliases: polygpen
### Keywords: smooth

### ** Examples


#  set up a sequence of 11 argument values
argvals <- seq(0,1,0.1)
#  set up the polygonal basis
basisobj <- create.polygonal.basis(argvals)
#  compute the 11 by 11 penalty matrix

penmat <- polygpen(basisobj)




