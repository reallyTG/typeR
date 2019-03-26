library(fda)


### Name: create.exponential.basis
### Title: Create an Exponential Basis
### Aliases: create.exponential.basis
### Keywords: smooth

### ** Examples


#  Create an exponential basis over interval [0,5]
#  with basis functions 1, exp(-t) and exp(-5t)
basisobj <- create.exponential.basis(c(0,5),3,c(0,-1,-5))
#  plot the basis
plot(basisobj)




