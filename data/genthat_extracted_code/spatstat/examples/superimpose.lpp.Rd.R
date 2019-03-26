library(spatstat)


### Name: superimpose.lpp
### Title: Superimpose Several Point Patterns on Linear Network
### Aliases: superimpose.lpp
### Keywords: spatial manip

### ** Examples

  X <- rpoislpp(5, simplenet)
  Y <- rpoislpp(10, simplenet)
  superimpose(X,Y) # not marked
  superimpose(A=X, B=Y) # multitype with types A and B



