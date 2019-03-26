library(compositions)


### Name: gsi.merge2signary
### Title: Auxiliary functions to compute user-defined ilr and ipt
###   transforms.
### Aliases: gsi.merge2signary gsi.ilrBase2signary gsi.optimalilrBase
###   gsi.buildilrBase gsi.signary2ilrBase gsi.OrderIlr
### Keywords: internal

### ** Examples

m <- matrix(data=c(-1,-2,
                  -3,-4,
                   1, 2),ncol=2,nrow=3,byrow=TRUE)
w <- gsi.merge2signary(m)
w
V=gsi.buildilrBase(w)
V
gsi.ilrBase2signary(V)
gsi.OrderIlr(V)



