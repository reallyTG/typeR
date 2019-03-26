library(RKEEL)


### Name: getAttributeLinesFromDataframes
### Title: Get attribute lines from data.frames
### Aliases: getAttributeLinesFromDataframes
### Keywords: utils

### ** Examples

iris_train <- RKEEL::loadKeelDataset("iris_train")
iris_test <- RKEEL::loadKeelDataset("iris_test")

attributeLines <- getAttributeLinesFromDataframes(iris_train, iris_test)



