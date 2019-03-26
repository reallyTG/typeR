library(pmml)


### Name: pmml.rpart
### Title: Generate PMML for rpart objects
### Aliases: pmml.rpart

### ** Examples


library(rpart)
fit <- rpart(Species ~ ., data=iris)
pmml(fit)

rm(fit)




