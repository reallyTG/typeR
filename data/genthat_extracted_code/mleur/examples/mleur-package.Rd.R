library(mleur)


### Name: mleur-package
### Title: Maximum likelihood unit root test
### Aliases: mleur-package
### Keywords: package ts

### ** Examples

#Example 1. Analysis of money velocity
library(lattice)
xyplot(vel, lwd=1.5, type="b", cex=0.7, pch=16, aspect=0.8,
 xlab="year", ylab="money velocity")
mleurDiag(vel)
mleur(vel)
dftest(vel)
ar1est(vel)
ar1est(vel, method="LSE")
#
#Example 2. 
#Difference in BAA and AAA corporate bonds 
library(lattice)
xyplot(DiffBA, lwd=1.5, type="b", cex=0.7, pch=16, aspect=0.8,
 xlab="year", ylab="money velocity")
mleurDiag(DiffBA)
mleur(DiffBA)
dftest(DiffBA)
ar1est(DiffBA)
ar1est(DiffBA, method="LSE")




