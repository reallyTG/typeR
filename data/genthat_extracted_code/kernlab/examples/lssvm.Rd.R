library(kernlab)


### Name: lssvm
### Title: Least Squares Support Vector Machine
### Aliases: lssvm lssvm-methods lssvm,formula-method lssvm,vector-method
###   lssvm,matrix-method lssvm,list-method lssvm,kernelMatrix-method
###   show,lssvm-method coef,lssvm-method predict,lssvm-method
### Keywords: classif nonlinear methods

### ** Examples

## simple example
data(iris)

lir <- lssvm(Species~.,data=iris)

lir

lirr <- lssvm(Species~.,data= iris, reduced = FALSE)

lirr

## Using the kernelMatrix interface

iris <- unique(iris)

rbf <- rbfdot(0.5)

k <- kernelMatrix(rbf, as.matrix(iris[,-5]))

klir <- lssvm(k, iris[, 5])

klir

pre <- predict(klir, k)



