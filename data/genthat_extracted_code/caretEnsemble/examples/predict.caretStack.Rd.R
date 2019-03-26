library(caretEnsemble)


### Name: predict.caretStack
### Title: Make predictions from a caretStack
### Aliases: predict.caretStack

### ** Examples

## Not run: 
##D library("rpart")
##D models <- caretList(
##D   x=iris[1:100,1:2],
##D   y=iris[1:100,3],
##D   trControl=trainControl(method="cv"),
##D   methodList=c("rpart", "glm")
##D )
##D meta_model <- caretStack(models, method="lm")
##D RMSE(predict(meta_model, iris[101:150,1:2]), iris[101:150,3])
## End(Not run)



