library(RMOA)


### Name: predict.MOA_trainedmodel
### Title: Predict using a MOA classifier, MOA regressor or MOA recommender
###   on a new dataset
### Aliases: predict.MOA_trainedmodel

### ** Examples

## Hoeffdingtree
hdt <- HoeffdingTree(numericEstimator = "GaussianNumericAttributeClassObserver")
data(iris)
## Make a training set
iris <- factorise(iris)
traintest <- list()
traintest$trainidx <- sample(nrow(iris), size=nrow(iris)/2)
traintest$trainingset <- iris[traintest$trainidx, ]
traintest$testset <- iris[-traintest$trainidx, ]
irisdatastream <- datastream_dataframe(data=traintest$trainingset)
## Train the model
hdtreetrained <- trainMOA(model = hdt, 
 Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, 
 data = irisdatastream)

## Score the model on the holdoutset
scores <- predict(hdtreetrained, 
   newdata=traintest$testset[, c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")], 
   type="response")
str(scores)
table(scores, traintest$testset$Species)
scores <- predict(hdtreetrained, newdata=traintest$testset, type="votes")
head(scores)

## Prediction based on recommendation engine
require(recommenderlab)
data(MovieLense)
x <- getData.frame(MovieLense)
x$itemid <- as.integer(as.factor(x$item))
x$userid <- as.integer(as.factor(x$user))
x$rating <- as.numeric(x$rating)
x <- head(x, 2000)

movielensestream <- datastream_dataframe(data=x)
movielensestream$get_points(3)

ctrl <- MOAoptions(model = "BRISMFPredictor", features = 10)
brism <- BRISMFPredictor(control=ctrl)
mymodel <- trainMOA(model = brism, rating ~ userid + itemid, 
 data = movielensestream, chunksize = 1000, trace=TRUE)

overview <- summary(mymodel$model)
str(overview)
predict(mymodel, head(x, 10), type = "response")

x <- expand.grid(userid=overview$users[1:10], itemid=overview$items)
predict(mymodel, x, type = "response")



