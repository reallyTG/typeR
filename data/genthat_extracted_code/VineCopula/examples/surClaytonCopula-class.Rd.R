library(VineCopula)


### Name: surClaytonCopula-class
### Title: Classes '"surClaytonCopula"', '"r90ClaytonCopula"' and
###   '"r270ClaytonCopula"'
### Aliases: surClaytonCopula-class
###   dduCopula,matrix,surClaytonCopula-method
###   dduCopula,numeric,surClaytonCopula-method
###   ddvCopula,matrix,surClaytonCopula-method
###   ddvCopula,numeric,surClaytonCopula-method r90ClaytonCopula-class
###   dduCopula,matrix,r90ClaytonCopula-method
###   dduCopula,numeric,r90ClaytonCopula-method
###   ddvCopula,matrix,r90ClaytonCopula-method
###   ddvCopula,numeric,r90ClaytonCopula-method r270ClaytonCopula-class
###   dduCopula,matrix,r270ClaytonCopula-method
###   dduCopula,numeric,r270ClaytonCopula-method
###   ddvCopula,matrix,r270ClaytonCopula-method
###   ddvCopula,numeric,r270ClaytonCopula-method
### Keywords: classes

### ** Examples


library(copula)

persp(surClaytonCopula(.5),dCopula,zlim=c(0,10))
persp(r90ClaytonCopula(-.5),dCopula,zlim=c(0,10))
persp(r270ClaytonCopula(-.5),dCopula,zlim=c(0,10))




