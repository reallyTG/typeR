library(pvclass)


### Name: cvpvs
### Title: Cross-Validated P-Values
### Aliases: cvpvs
### Keywords: classif

### ** Examples

X <- iris[,1:4]
Y <- iris[,5]

cvpvs(X,Y,method='k',k=10,distance='d')



