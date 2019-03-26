library(rCBA)


### Name: frameToRules
### Title: Conversion of 'data.frame' to 'rules' from 'arules'
### Aliases: frameToRules

### ** Examples

library("rCBA")
data("iris")

output <- rCBA::buildFPGrowth(iris[sample(nrow(iris), 20),], "Species", parallel=FALSE)
model <- as(output$model,"data.frame")

rules <- rCBA::frameToRules(model)
inspect(rules)




