library(spatstat)


### Name: slrm
### Title: Spatial Logistic Regression
### Aliases: slrm
### Keywords: spatial models

### ** Examples

     X <- copper$SouthPoints
     slrm(X ~ 1)
     slrm(X ~ x+y)

     slrm(X ~ x+y, link="cloglog")
     # specify a grid of 2-km-square pixels
     slrm(X ~ 1, eps=2)

     Y <- copper$SouthLines
     Z <- distmap(Y)
     slrm(X ~ Z)
     slrm(X ~ Z, dataAtPoints=list(Z=nncross(X,Y,what="dist")))

     mur <- murchison
     mur$dfault <- distfun(mur$faults)
     slrm(gold ~ dfault, data=mur)
     slrm(gold ~ dfault + greenstone, data=mur)
     slrm(gold ~ dfault, data=mur, splitby="greenstone")



