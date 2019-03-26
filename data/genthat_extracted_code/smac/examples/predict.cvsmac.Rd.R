library(smac)


### Name: predict.cvsmac
### Title: A function that provides class label prediction and class
###   conditional probability estimation for objects returned by the
###   "cvsmac" function.
### Aliases: predict.cvsmac

### ** Examples

data(ex1.data)
a=cvsmac(ex1.data$ex1.x,ex1.data$ex1.y,loss="p",nlambda=30)
predict(a,ex1.data$ex1.new.x)



