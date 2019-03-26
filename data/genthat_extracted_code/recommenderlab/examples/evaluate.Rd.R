library(recommenderlab)


### Name: evaluate
### Title: Evaluate a Recommender Models
### Aliases: evaluate evaluate,evaluationScheme,character-method
###   evaluate,evaluationScheme,list-method

### ** Examples

### evaluate top-N list recommendations on a 0-1 data set
## Note: we sample only 100 users to make the example run faster
data("MSWeb")
MSWeb10 <- sample(MSWeb[rowCounts(MSWeb) >10,], 100)

## create an evaluation scheme (10-fold cross validation, given-3 scheme)
es <- evaluationScheme(MSWeb10, method="cross-validation",
        k=10, given=3)

## run evaluation
ev <- evaluate(es, "POPULAR", n=c(1,3,5,10))
ev

## look at the results (by the length of the topNList)
avg(ev)
plot(ev, annotate = TRUE)

## evaluate several algorithms with a list
algorithms <- list(
		RANDOM = list(name = "RANDOM", param = NULL),
		POPULAR = list(name = "POPULAR", param = NULL)
		)

evlist <- evaluate(es, algorithms, n=c(1,3,5,10))
plot(evlist, legend="topright")

## select the first results
evlist[[1]]

### Evaluate using a data set with real-valued ratings
## Note: we sample only 100 users to make the example run faster
data("Jester5k")
es <- evaluationScheme(Jester5k[1:100], method="cross-validation",
  k=10, given=10, goodRating=5)
## Note: goodRating is used to determine positive ratings

## predict top-N recommendation lists
## (results in TPR/FPR and precision/recall)
ev <- evaluate(es, "RANDOM", type="topNList", n=10)
avg(ev)

## predict missing ratings
## (results in RMSE, MSE and MAE)
ev <- evaluate(es, "RANDOM", type="ratings")
avg(ev)



