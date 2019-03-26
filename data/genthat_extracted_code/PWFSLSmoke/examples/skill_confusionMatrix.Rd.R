library(PWFSLSmoke)


### Name: skill_confusionMatrix
### Title: Confusion Matrix Statistics
### Aliases: skill_confusionMatrix

### ** Examples

predicted <- sample(c(TRUE,FALSE), 1000, replace=TRUE, prob=c(0.3,0.7))
observed <- sample(c(TRUE,FALSE), 1000, replace=TRUE, prob=c(0.3,0.7))
cm <- skill_confusionMatrix(predicted, observed)
print(cm)




