library(SOMbrero)


### Name: predict.somRes
### Title: Predict the classification of a new observation
### Aliases: predict.somRes
### Keywords: cluster

### ** Examples

set.seed(2343)
my.som <- trainSOM(x.data=iris[-100,1:4], dimension=c(5,5))
predict(my.som, iris[100,1:4])



