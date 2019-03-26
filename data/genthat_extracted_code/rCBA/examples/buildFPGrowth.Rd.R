library(rCBA)


### Name: buildFPGrowth
### Title: Build classifier function (FP-Growth-based)
### Aliases: buildFPGrowth

### ** Examples

library("rCBA")
data("iris")

output <- rCBA::buildFPGrowth(iris[sample(nrow(iris), 20),], "Species", parallel=FALSE)
model <- output$model

predictions <- rCBA::classification(iris, model)
table(predictions)
sum(as.character(iris$Species)==as.character(predictions), na.rm=TRUE) / length(predictions)




