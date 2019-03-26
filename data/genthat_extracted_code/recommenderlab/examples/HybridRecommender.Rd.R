library(recommenderlab)


### Name: HybridRecommender
### Title: Create a Hybrid Recommender
### Aliases: HybridRecommender

### ** Examples

data("MovieLense")
MovieLense100 <- MovieLense[rowCounts(MovieLense) >100,]
train <- MovieLense100[1:100]
test <- MovieLense100[101:103]

## mix popular movies with a random recommendations for diversity and
## rerecommend some movies the user liked.
recom <- HybridRecommender(
  Recommender(train, method = "POPULAR"),
  Recommender(train, method = "RANDOM"),
  Recommender(train, method = "RERECOMMEND"),
  weights = c(.6, .1, .3)
  )

recom

getModel(recom)

as(predict(recom, test), "list")



