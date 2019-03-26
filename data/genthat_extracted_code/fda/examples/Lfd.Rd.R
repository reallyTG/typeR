library(fda)


### Name: Lfd
### Title: Define a Linear Differential Operator Object
### Aliases: Lfd
### Keywords: smooth

### ** Examples

#  Set up the harmonic acceleration operator
dayrange  <- c(0,365)
Lbasis  <- create.constant.basis(dayrange,
                  axes=list("axesIntervals"))
Lcoef   <- matrix(c(0,(2*pi/365)^2,0),1,3)
bfdobj  <- fd(Lcoef,Lbasis)
bwtlist <- fd2list(bfdobj)
harmaccelLfd <- Lfd(3, bwtlist)



