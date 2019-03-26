library(pscl)


### Name: vectorRepresentation
### Title: convert roll call matrix to series of vectors
### Aliases: vectorRepresentation
### Keywords: manip utilities

### ** Examples

data(s109)
y <- vectorRepresentation(s109)
apply(y,2,table,exclude=NULL)



