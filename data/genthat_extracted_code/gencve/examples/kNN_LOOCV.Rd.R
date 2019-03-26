library(gencve)


### Name: kNN_LOOCV
### Title: Select k with Leave-one-out CV
### Aliases: kNN_LOOCV
### Keywords: classif

### ** Examples

Xy <- rmix(300) #training data
kNN_LOOCV(Xy[,1:2], Xy[,3], plot=FALSE)



