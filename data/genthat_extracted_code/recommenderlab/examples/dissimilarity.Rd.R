library(recommenderlab)


### Name: dissimilarity
### Title: Dissimilarity and Similarity Calculation Between Rating Data
### Aliases: dissimilarity dissimilarity,binaryRatingMatrix-method
###   dissimilarity,realRatingMatrix-method similarity
###   similarity,ratingMatrix-method

### ** Examples

data(MSWeb)

## between 5 users
dissimilarity(MSWeb[1:5,], method = "jaccard")
similarity(MSWeb[1:5,], method = "jaccard")

## between first 3 items
dissimilarity(MSWeb[,1:3], method = "jaccard", which = "items")
similarity(MSWeb[,1:3], method = "jaccard", which = "items")

## cross-similarity between first 2 users and users 10-20
similarity(MSWeb[1:2,], MSWeb[10:20,], method="jaccard")



