library(recommenderlab)


### Name: Jester5k
### Title: Jester dataset (5k sample)
### Aliases: Jester5k JesterJokes
### Keywords: datasets

### ** Examples

data(Jester5k)
Jester5k

## number of ratings
nratings(Jester5k)

## number of ratings per user
summary(rowCounts(Jester5k))

## rating distribution
hist(getRatings(Jester5k), main="Distribution of ratings")

## 'best' joke with highest average rating
best <- which.max(colMeans(Jester5k))
cat(JesterJokes[best])



