library(labelrank)


### Name: nn_rank
### Title: Predicting rankings using the nearest neighbor algorithm
### Aliases: nn_rank

### ** Examples

train.x <- lr.num[1:16,]
test.x <- lr.num[17,]
ranking <- nn_rank(train.x, y, test.x, n=1,k=3)



