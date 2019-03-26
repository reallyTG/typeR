library(RMOA)


### Name: MOA_regressor
### Title: Create a MOA regressor
### Aliases: MOA_regressor

### ** Examples

mymodel <- MOA_regressor(model = "FIMTDD")
mymodel
data(iris)
iris <- factorise(iris)
irisdatastream <- datastream_dataframe(data=iris)
## Train the model
mytrainedmodel <- trainMOA(model = mymodel, 
 Sepal.Length ~ Petal.Length + Species, data = irisdatastream)
mytrainedmodel$model

summary(lm(Sepal.Length ~ Petal.Length + Species, data = iris))
predict(mytrainedmodel, newdata=iris)



