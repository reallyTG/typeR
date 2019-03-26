library(pvclass)


### Name: pvclass-package
### Title: P-Values for Classification
### Aliases: pvclass-package pvclass
### Keywords: package classif

### ** Examples

X <- iris[c(1:49, 51:99, 101:149), 1:4]
Y <- iris[c(1:49, 51:99, 101:149), 5]
NewX <- iris[c(50, 100, 150), 1:4]

cv <- cvpvs(X,Y)
analyze.pvs(cv,Y)

pv <- pvs(NewX, X, Y, method = 'k', k = 10)
analyze.pvs(pv)



