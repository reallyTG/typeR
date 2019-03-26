library(kernlab)


### Name: kcca-class
### Title: Class "kcca"
### Aliases: kcca-class kcor xcoef ycoef kcor,kcca-method xcoef,kcca-method
###   xvar,kcca-method ycoef,kcca-method yvar,kcca-method
### Keywords: classes

### ** Examples


## dummy data
x <- matrix(rnorm(30),15)
y <- matrix(rnorm(30),15)

kcca(x,y,ncomps=2)




