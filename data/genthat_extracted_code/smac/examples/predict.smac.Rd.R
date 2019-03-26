library(smac)


### Name: predict.smac
### Title: A function that provides class label prediction and class
###   conditional probability estimation for objects returned by the "smac"
###   function.
### Aliases: predict.smac

### ** Examples

data(ex1.data)
a=smac(ex1.data$ex1.x,ex1.data$ex1.y,loss="p",nlambda=30)
predict(a,ex1.data$ex1.new.x)



