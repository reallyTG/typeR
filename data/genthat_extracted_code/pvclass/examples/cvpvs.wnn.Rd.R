library(pvclass)


### Name: cvpvs.wnn
### Title: Cross-Validated P-Values (Weighted Nearest Neighbors)
### Aliases: cvpvs.wnn
### Keywords: classif

### ** Examples

X <- iris[, 1:4]
Y <- iris[, 5]

cvpvs.wnn(X, Y, wtype = 'l', tau = 0.5)



