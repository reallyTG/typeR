library(gremlin)


### Name: tr
### Title: Matrix trace methods.
### Aliases: tr tr.default tr.dgCMatrix tr.dsCMatrix tr.default
###   tr.dgCMatrix tr.dsCMatrix

### ** Examples

  M <- matrix(seq(9), nrow = 3)
  tr(M)
  # Create sparse 'Matrix'
  dgcM <- as(M, "dgCMatrix")
  # compare `tr()` methods
  tr(M) == tr(dgcM)  #<-- should be TRUE



