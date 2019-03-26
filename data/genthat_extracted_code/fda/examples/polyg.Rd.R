library(fda)


### Name: polyg
### Title: Polygonal Basis Function Values
### Aliases: polyg
### Keywords: smooth

### ** Examples


#  set up a set of 21 argument values
x <- seq(0,1,0.05)
#  set up a set of 11 argument values
argvals <- seq(0,1,0.1)
#  with the default period (1) and derivative (0)
basismat <- polyg(x, argvals)
#  plot the basis functions
matplot(x, basismat, type="l")




