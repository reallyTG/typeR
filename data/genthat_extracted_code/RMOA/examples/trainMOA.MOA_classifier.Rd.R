library(RMOA)


### Name: trainMOA.MOA_classifier
### Title: Train a MOA classifier (e.g. a HoeffdingTree) on a datastream
### Aliases: trainMOA.MOA_classifier

### ** Examples

hdt <- HoeffdingTree(numericEstimator = "GaussianNumericAttributeClassObserver")
hdt
data(iris)
iris <- factorise(iris)
irisdatastream <- datastream_dataframe(data=iris)
irisdatastream$get_points(3)

mymodel <- trainMOA(model = hdt, Species ~ Sepal.Length + Sepal.Width + Petal.Length, 
 data = irisdatastream, chunksize = 10)
mymodel$model
irisdatastream$reset()
mymodel <- trainMOA(model = hdt, 
 Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Length^2, 
 data = irisdatastream, chunksize = 10, reset=TRUE, trace=TRUE)
mymodel$model



