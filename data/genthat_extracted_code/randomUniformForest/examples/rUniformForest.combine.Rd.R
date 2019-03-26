library(randomUniformForest)


### Name: rUniformForest.combine
### Title: Incremental learning for random Uniform Forests
### Aliases: rUniformForest.combine
### Keywords: incremental learning

### ** Examples

## not run
## Classification : synthetic data 
## get many forests and combine them

# n = 200;  p = 10
## Simulate 'p' gaussian vectors with random parameters between -10 and 10.
# X <- simulationData(n,p)

## Make a rule to create response vector
# epsilon1 = runif(n,-1,1)
# epsilon2 = runif(n,-1,1)
# rule = 2*(X[,1]*X[,2] + X[,3]*X[,4]) + epsilon1*X[,5] + epsilon2*X[,6]

# Y <- as.factor(ifelse(rule > mean(rule), 1, 0))

## create many subsamples
# manyCuts <- cut(1:n, 5, labels = FALSE)

## compute many different models 
# ruf1 <- randomUniformForest(X[which(manyCuts == 1),], Y[which(manyCuts == 1)], 
# ntree = 30, mtry = 2, BreimanBounds = FALSE, importance = FALSE, threads = 1)

# ruf2 <- randomUniformForest(X[which(manyCuts == 2),], Y[which(manyCuts == 2)],
# ntree = 40, nodesize = 10, BreimanBounds = FALSE, importance = FALSE, threads = 1)

# ruf3 <- randomUniformForest(X[which(manyCuts == 3),], Y[which(manyCuts == 3)],
# ntree = 50, bagging = TRUE, BreimanBounds = FALSE, importance = FALSE, threads = 1)

## combine them in one ensemble 
# ruf.combined <- rUniformForest.combine(ruf1, ruf2, ruf3)
# ruf.combined

## or 
# rufObjects <- list(ruf1, ruf2, ruf3)
# ruf.combined <- rUniformForest.combine(rufObjects)

## remove 10 older trees
# ruf.combined <- rm.trees(ruf.combined, method = "oldest", howMany = 10)
# ruf.combined

## compute a new model and update
# ruf4 <- randomUniformForest(X[which(manyCuts == 4),], Y[which(manyCuts == 4)],
# ntree = 40, rebalancedsampling = TRUE, BreimanBounds = FALSE, threads = 1)
# ruf.updateCombined <- rUniformForest.combine(ruf.combined, ruf4)
# ruf.updateCombined

# ruf.pred <- predict(ruf.updateCombined, X[which(manyCuts == 5),])

## confusion matrix
# table(ruf.pred, Y[which(manyCuts == 5)])

## comparison with offline learning (that will always be better, 
## except in the case of a shifting distribution)
# ruf.offline <- randomUniformForest(X[which(manyCuts != 5),], Y[which(manyCuts !=5)], 
# threads = 1, ntree = 150, BreimanBounds = FALSE)
# ruf.offline.pred <- predict(ruf.offline, X[which(manyCuts == 5),])

## confusion matrix
# table(ruf.offline.pred, Y[which(manyCuts == 5)])



