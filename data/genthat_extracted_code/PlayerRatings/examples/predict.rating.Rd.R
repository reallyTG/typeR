library(PlayerRatings)


### Name: predict.rating
### Title: Predict Result Of Games Based On Player Ratings
### Aliases: predict.rating
### Keywords: models

### ** Examples

afl <- aflodds[,c(2,3,4,7)]
train <- afl[afl$Week <= 80,]
test <- afl[afl$Week > 80,]
robj <- elo(train)
pvals <- predict(robj, test)



