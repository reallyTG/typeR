library(rCBA)


### Name: build
### Title: Build classifier function (Apriori-based)
### Aliases: build

### ** Examples

library("rCBA")
data("iris")

output <- rCBA::build(iris,sa = list(alpha=0.5), parallel=FALSE) # speeding up the cooling
model <- output$model

predictions <- rCBA::classification(iris, model)
table(predictions)
sum(as.character(iris$Species)==as.character(predictions), na.rm=TRUE) / length(predictions)




