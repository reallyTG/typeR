library(MLInterfaces)


### Name: xvalSpec
### Title: container for information specifying a cross-validated machine
###   learning exercise
### Aliases: xvalSpec xvalSpec-class
### Keywords: models

### ** Examples

library("MASS")
data(crabs)
set.seed(1234)
#
# demonstrate cross validation
#
nn1cv = MLearn(sp~CW+RW, data=crabs, nnetI, xvalSpec("LOG",
   5, balKfold.xvspec(5)), size=3, decay=.01 )
nn1cv
confuMat(nn1cv)
names(RObject(nn1cv)[[1]])
RObject(RObject(nn1cv)[[1]]$mlans)



