library(fda)


### Name: create.power.basis
### Title: Create a Power Basis Object
### Aliases: create.power.basis
### Keywords: smooth

### ** Examples


#  Create a power basis over the interval [1e-7,1]
#  with powers or exponents -1, -0.5, 0, 0.5 and 1
basisobj <- create.power.basis(c(1e-7,1), 5, seq(-1,1,0.5))
#  plot the basis
plot(basisobj)




