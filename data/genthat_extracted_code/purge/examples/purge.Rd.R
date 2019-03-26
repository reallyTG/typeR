library(purge)


### Name: purge
### Title: Purge training data from a model
### Aliases: purge purge.coxph purge.default purge.glm purge.glmerMod
###   purge.lm purge.merMod purge.randomForest purge.ranger purge.rpart

### ** Examples

x <- rnorm(1000)
y <- x + rnorm(1000)
unpurged.model <- lm(y ~ x)
purged.model <- purge(unpurged.model)
object.size(unpurged.model)
object.size(purged.model)



