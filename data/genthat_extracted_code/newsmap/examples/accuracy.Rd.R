library(newsmap)


### Name: accuracy
### Title: Evaluate classification accuracy in precision and recall
### Aliases: accuracy

### ** Examples

class_pred <- c('US', 'GB', 'US', 'CN', 'JP', 'FR', 'CN') # prediction
class_true <- c('US', 'FR', 'US', 'CN', 'KP', 'EG', 'US') # true class
acc <- accuracy(class_pred, class_true)
print(acc)
summary(acc)



