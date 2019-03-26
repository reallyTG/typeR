library(RMOA)


### Name: summary.MOA_recommender
### Title: Summary statistics of a MOA recommender
### Aliases: summary.MOA_recommender

### ** Examples

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



