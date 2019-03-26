library(quantspec)


### Name: getLevels-QSpecQuantity
### Title: Get attribute 'levels' from a 'QSpecQuantity'.
### Aliases: getLevels,QSpecQuantity-method getLevels-QSpecQuantity
### Keywords: Access-functions

### ** Examples

qPG         <- quantilePG(rnorm(10), levels.1=c(0.25,0.5))
levels.list <- getLevels(qPG)
levels.1    <- getLevels(qPG,1)



