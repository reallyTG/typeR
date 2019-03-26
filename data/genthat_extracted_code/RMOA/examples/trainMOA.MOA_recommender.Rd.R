library(RMOA)


### Name: trainMOA.MOA_recommender
### Title: Train a MOA recommender (e.g. a BRISMFPredictor) on a datastream
### Aliases: trainMOA.MOA_recommender

### ** Examples

require(recommenderlab)
data(MovieLense)
x <- getData.frame(MovieLense)
x$itemid <- as.integer(as.factor(x$item))
x$userid <- as.integer(as.factor(x$user))
x$rating <- as.numeric(x$rating)
x <- head(x, 5000)

movielensestream <- datastream_dataframe(data=x)
movielensestream$get_points(3)

ctrl <- MOAoptions(model = "BRISMFPredictor", features = 10)
brism <- BRISMFPredictor(control=ctrl)
mymodel <- trainMOA(model = brism, rating ~ userid + itemid, 
 data = movielensestream, chunksize = 1000, trace=TRUE)
summary(mymodel$model)



