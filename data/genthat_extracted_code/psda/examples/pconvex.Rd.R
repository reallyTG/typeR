library(psda)


### Name: pconvex
### Title: Convex verification
### Aliases: pconvex

### ** Examples

x <- psim(1,4)
x <- x[[1]] 
pconvex(x) 

x <- matrix(unlist(psim(1,4)), ncol= 2)
pconvex(x) #run



