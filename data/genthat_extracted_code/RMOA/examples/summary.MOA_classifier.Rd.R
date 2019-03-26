library(RMOA)


### Name: summary.MOA_classifier
### Title: Summary statistics of a MOA classifier
### Aliases: summary.MOA_classifier

### ** Examples

hdt <- HoeffdingTree(numericEstimator = "GaussianNumericAttributeClassObserver")
hdt
data(iris)
iris <- factorise(iris)
irisdatastream <- datastream_dataframe(data=iris)
## Train the model
hdtreetrained <- trainMOA(model = hdt, 
 Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, 
 data = irisdatastream)
summary(hdtreetrained$model)



