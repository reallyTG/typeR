library(arc)


### Name: predict.CBARuleModel
### Title: Apply Rule Model
### Aliases: predict.CBARuleModel

### ** Examples

  allData <- datasets::iris[sample(nrow(datasets::iris)),]
  trainFold <- allData[1:100,]
  testFold <- allData[101:nrow(allData),]
  #increase for more accurate results in longer time
  target_rule_count <- 1000
  classAtt <- "Species"
  rm <- cba(trainFold, classAtt, list(target_rule_count = target_rule_count))
  prediction <- predict(rm, testFold)
  acc <- CBARuleModelAccuracy(prediction, testFold[[classAtt]])
  message(acc)



