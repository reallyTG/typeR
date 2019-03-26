library(PlayerRatings)


### Name: metrics
### Title: Prediction Evaluation
### Aliases: metrics
### Keywords: manip

### ** Examples

afl <- aflodds[,c(2,3,4,7)]
train <- afl[afl$Week <= 80,]
test <- afl[afl$Week > 80,]
robj <- elo(train)
metrics(test$Score, predict(robj, test))
metrics(test$Score, predict(robj, test), scale = FALSE)



