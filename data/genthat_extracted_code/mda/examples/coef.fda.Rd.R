library(mda)


### Name: coef.fda
### Title: Produce coefficients for an fda or mda object
### Aliases: coef.fda coef.mda
### Keywords: classif

### ** Examples

data(iris)
irisfit <- fda(Species ~ ., data = iris)
coef(irisfit)
mfit=mda(Species~.,data=iris,subclass=2)
coef(mfit)



