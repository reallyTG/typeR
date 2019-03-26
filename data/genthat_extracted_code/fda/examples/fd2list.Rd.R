library(fda)


### Name: fd2list
### Title: Convert a univariate functional data object to s list
### Aliases: fd2list
### Keywords: smooth

### ** Examples

Lbasis  = create.constant.basis(c(0,365));  #  create a constant basis
Lcoef   = matrix(c(0,(2*pi/365)^2,0),1,3)   #  set up three coefficients
wfdobj  = fd(Lcoef,Lbasis)      # define an FD object for weight functions
wfdlist = fd2list(wfdobj)       # convert the FD object to a cell object
harmaccelLfd = Lfd(3, wfdlist)  #  define the operator object



