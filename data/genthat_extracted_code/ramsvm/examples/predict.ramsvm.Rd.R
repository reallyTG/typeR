library(ramsvm)


### Name: predict
### Title: A function that provides class label predictions for objects
###   returned by the "ramsvm" function.
### Aliases: predict predict,ramsvm-method

### ** Examples

data(iris)
a <- ramsvm(x = as.matrix(iris[,-5]),
            y = iris[,5],
            lambda = 0.2,
            kernel="gaussian")
predict(a)



