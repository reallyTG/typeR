library(recommenderlab)


### Name: calcPredictionAccuracy
### Title: Calculate the Prediction Error for a Recommendation
### Aliases: calcPredictionAccuracy
###   calcPredictionAccuracy,realRatingMatrix,realRatingMatrix-method
###   calcPredictionAccuracy,topNList,binaryRatingMatrix-method
###   calcPredictionAccuracy,topNList,realRatingMatrix-method

### ** Examples

### real valued recommender  
data(Jester5k)

## create 90/10 split (known/unknown) for the first 500 users in Jester5k
e <- evaluationScheme(Jester5k[1:500,], method="split", train=0.9, 
    k=1, given=15)
e

## create a user-based CF recommender using training data
r <- Recommender(getData(e, "train"), "UBCF")

## create predictions for the test data using known ratings (see given above)
p <- predict(r, getData(e, "known"), type="ratings")
p

## compute error metrics averaged per user and then averaged over all 
## recommendations
calcPredictionAccuracy(p, getData(e, "unknown"))
head(calcPredictionAccuracy(p, getData(e, "unknown"), byUser=TRUE))

## evaluate topNLists instead (you need to specify given and goodRating!)
p <- predict(r, getData(e, "known"), type="topNList")
p
calcPredictionAccuracy(p, getData(e, "unknown"), given=15, goodRating=5) 
  
## evaluate a binary recommender
data(MSWeb)
MSWeb10 <- sample(MSWeb[rowCounts(MSWeb) >10,], 50)

e <- evaluationScheme(MSWeb10, method="split", train=0.9, 
    k=1, given=3)
e
  
## create a user-based CF recommender using training data
r <- Recommender(getData(e, "train"), "UBCF")
  
## create predictions for the test data using known ratings (see given above)
p <- predict(r, getData(e, "known"), type="topNList", n=10)
p

calcPredictionAccuracy(p, getData(e, "unknown"), given=3)



