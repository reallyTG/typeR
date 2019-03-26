library(recommenderlab)


### Name: Recommender
### Title: Create a Recommender Model
### Aliases: Recommender recommenderRegistry
###   Recommender,ratingMatrix-method getModel,Recommender-method

### ** Examples

data("MSWeb")
MSWeb10 <- sample(MSWeb[rowCounts(MSWeb) >10,], 100)

rec <- Recommender(MSWeb10, method = "POPULAR")
rec

getModel(rec)

## look at registry and a few methods
recommenderRegistry$get_entry_names()

recommenderRegistry$get_entry("POPULAR", dataType = "binaryRatingMatrix")

recommenderRegistry$get_entry("SVD", dataType = "realRatingMatrix")



