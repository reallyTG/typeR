library(irtrees)


### Name: neslat
### Title: Example Data: Nested Hierarchical Categories
### Aliases: neslat
### Keywords: datasets

### ** Examples

str(neslat)
str(neslatT <-
    exogenize(neslat, cbind(c(1,1,1), c(1,0,0), c(0,1,0), c(0,0,1)), 
	endnode=rep(1:3, each = 10)))



