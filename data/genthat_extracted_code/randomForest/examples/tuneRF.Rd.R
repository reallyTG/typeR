library(randomForest)


### Name: tuneRF
### Title: Tune randomForest for the optimal mtry parameter
### Aliases: tuneRF
### Keywords: classif tree

### ** Examples

data(fgl, package="MASS")
fgl.res <- tuneRF(fgl[,-10], fgl[,10], stepFactor=1.5)



