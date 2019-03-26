library(Myrrix)


### Name: RecommenderMethods-methods
### Title: Methods to apply on objects of class ClientRecommender and
###   ServerRecommender
### Aliases: await await,ClientRecommender-method
###   await,ServerRecommender-method estimatePreference
###   estimatePreference,ClientRecommender,numeric,numeric-method
###   estimatePreference,ServerRecommender,numeric,numeric-method
###   getAllItemIDs getAllItemIDs,ClientRecommender-method
###   getAllItemIDs,ServerRecommender-method getAllUserIDs
###   getAllUserIDs,ClientRecommender-method
###   getAllUserIDs,ServerRecommender-method getMyrrixHyperParameters
###   getMyrrixHyperParameters,character-method
###   getMyrrixHyperParameters,missing-method ingest
###   ingest,ClientRecommender,character-method
###   ingest,ServerRecommender,character-method mostPopularItems
###   mostPopularItems,ClientRecommender,integer-method
###   mostPopularItems,ServerRecommender,integer-method recommend
###   recommend,ClientRecommender,numeric,integer-method
###   RecommenderMethods-methods
###   recommend,ServerRecommender,numeric,integer-method
###   setMyrrixHyperParameters setMyrrixHyperParameters,list-method

### ** Examples

##
## Set Hyperparameters to tune the Myrrix recommendation engine
##
x <- getMyrrixHyperParameters()
str(x)
setMyrrixHyperParameters(
 params=list(model.iterations.max = 10, model.features=30, model.als.lambda=0.1))
x <- getMyrrixHyperParameters(
 parameters=c("model.iterations.max","model.features","model.als.lambda"))
str(x)
##
## Build a recommendation model locally
##
## Not run: 
##D inputfile <- file.path(tempdir(), "audioscrobbler-data.subset.csv.gz")
##D download.file(
##D  url="http://dom2bevkhhre1.cloudfront.net/audioscrobbler-data.subset.csv.gz",
##D  destfile = inputfile)
##D ## Set hyperparameters
##D setMyrrixHyperParameters(
##D  params=list(model.iterations.max = 2, model.features=10, model.als.lambda=0.1))
##D x <- getMyrrixHyperParameters(
##D  parameters=c("model.iterations.max","model.features","model.als.lambda"))
##D str(x)
##D ## Build a model which will be stored in getwd() and ingest the data file into it
##D recommendationengine <- new("ServerRecommender", localInputDir=getwd())
##D ingest(recommendationengine, inputfile)
##D await(recommendationengine)
##D ## Get all users/items and score
##D items <- getAllItemIDs(recommendationengine)
##D users <- getAllUserIDs(recommendationengine)
##D estimatePreference(recommendationengine, userID=users[5], itemIDs=items[1:20])
##D mostPopularItems(recommendationengine, howMany=10L)
##D recommend(recommendationengine, userID=users[5], howMany=10L)
## End(Not run)



