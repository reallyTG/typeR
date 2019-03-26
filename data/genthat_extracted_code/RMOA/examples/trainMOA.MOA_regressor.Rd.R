library(RMOA)


### Name: trainMOA.MOA_regressor
### Title: Train a MOA regressor (e.g. a FIMTDD) on a datastream
### Aliases: trainMOA.MOA_regressor

### ** Examples

mymodel <- MOA_regressor(model = "FIMTDD")
mymodel
data(iris)
iris <- factorise(iris)
irisdatastream <- datastream_dataframe(data=iris)
irisdatastream$get_points(3)
## Train the model
mytrainedmodel <- trainMOA(model = mymodel, 
 Sepal.Length ~ Petal.Length + Species, data = irisdatastream)
mytrainedmodel$model
irisdatastream$reset()
mytrainedmodel <- trainMOA(model = mytrainedmodel$model, 
 Sepal.Length ~ Petal.Length + Species, data = irisdatastream, 
 chunksize = 10, reset=FALSE, trace=TRUE)
mytrainedmodel$model 



