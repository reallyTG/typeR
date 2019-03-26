library(pmml)


### Name: pmml.randomForest
### Title: Generate PMML for randomForest objects
### Aliases: pmml.randomForest

### ** Examples


# Build a simple randomForest model

library(randomForest)
iris.rf <- randomForest(Species ~ ., data=iris, ntree=20)

# Convert to pmml

pmml(iris.rf)

rm(iris.rf)




