library(psych)


### Name: structure.list
### Title: Create factor model matrices from an input list
### Aliases: structure.list phi.list
### Keywords: multivariate models

### ** Examples

fx <- structure.list(9,list(F1=c(1,2,3),F2=c(4,5,6),F3=c(7,8,9)))
fy <- structure.list(3,list(Y=c(1,2,3)),"Y")
phi <- phi.list(4,list(F1=c(4),F2=c(1,4),F3=c(2),F4=c(1,2,3)))
fx
phi
fy





