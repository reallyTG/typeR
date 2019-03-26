library(MLInterfaces)


### Name: fsHistory
### Title: extract history of feature selection for a cross-validated
###   machine learner
### Aliases: fsHistory
### Keywords: models

### ** Examples

data(iris)
iris2 = iris[ iris$Species %in% levels(iris$Species)[1:2], ]
iris2$Species = factor(iris2$Species) # drop unused levels
x1 = MLearn(Species~., iris2, ldaI, xvalSpec("LOG", 3, 
   balKfold.xvspec(3), fs.absT(3)))
fsHistory(x1)



