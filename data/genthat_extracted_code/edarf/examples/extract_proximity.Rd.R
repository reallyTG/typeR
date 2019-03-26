library(edarf)


### Name: extract_proximity
### Title: Methods to extract proximity matrices from random forests
### Aliases: extract_proximity

### ** Examples

library(randomForest)

fit = randomForest(hp ~ ., mtcars, proximity = TRUE)
extract_proximity(fit)

fit = randomForest(Species ~ ., iris, proximity = TRUE)
extract_proximity(fit)



