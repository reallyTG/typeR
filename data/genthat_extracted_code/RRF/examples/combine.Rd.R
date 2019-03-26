library(RRF)


### Name: combine
### Title: Combine Ensembles of Trees
### Aliases: combine
### Keywords: regression classif

### ** Examples

data(iris)
rf1 <- RRF(Species ~ ., iris, ntree=50, norm.votes=FALSE)
rf2 <- RRF(Species ~ ., iris, ntree=50, norm.votes=FALSE)
rf3 <- RRF(Species ~ ., iris, ntree=50, norm.votes=FALSE)
rf.all <- combine(rf1, rf2, rf3)
print(rf.all)



