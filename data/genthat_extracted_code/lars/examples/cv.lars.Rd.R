library(lars)


### Name: cv.lars
### Title: Computes K-fold cross-validated error curve for lars
### Aliases: cv.lars
### Keywords: regression

### ** Examples

data(diabetes)
attach(diabetes)
cv.lars(x2,y,trace=TRUE,max.steps=80)
detach(diabetes)



