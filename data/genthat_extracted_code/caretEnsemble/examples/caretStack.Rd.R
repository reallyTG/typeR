library(caretEnsemble)


### Name: caretStack
### Title: Combine several predictive models via stacking
### Aliases: caretStack

### ** Examples

## Not run: 
##D library("rpart")
##D models <- caretList(
##D   x=iris[1:50,1:2],
##D   y=iris[1:50,3],
##D   trControl=trainControl(method="cv"),
##D   methodList=c("rpart", "glm")
##D )
##D caretStack(models, method="glm")
## End(Not run)



