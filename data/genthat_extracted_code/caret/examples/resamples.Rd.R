library(caret)


### Name: resamples
### Title: Collation and Visualization of Resampling Results
### Aliases: resamples resamples.default summary.resamples sort.resamples
###   as.matrix.resamples as.data.frame.resamples modelCor print.resamples
### Keywords: models

### ** Examples



data(BloodBrain)
set.seed(1)

## tmp <- createDataPartition(logBBB,
##                            p = .8,
##                            times = 100)

## rpartFit <- train(bbbDescr, logBBB,
##                   "rpart",
##                   tuneLength = 16,
##                   trControl = trainControl(
##                     method = "LGOCV", index = tmp))

## ctreeFit <- train(bbbDescr, logBBB,
##                   "ctree",
##                   trControl = trainControl(
##                     method = "LGOCV", index = tmp))

## earthFit <- train(bbbDescr, logBBB,
##                   "earth",
##                   tuneLength = 20,
##                   trControl = trainControl(
##                     method = "LGOCV", index = tmp))

## or load pre-calculated results using:
## load(url("http://caret.r-forge.r-project.org/exampleModels.RData"))

## resamps <- resamples(list(CART = rpartFit,
##                           CondInfTree = ctreeFit,
##                           MARS = earthFit))

## resamps
## summary(resamps)




