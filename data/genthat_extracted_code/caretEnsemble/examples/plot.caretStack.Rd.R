library(caretEnsemble)


### Name: plot.caretStack
### Title: Plot a caretStack object
### Aliases: plot.caretStack

### ** Examples

## Not run: 
##D library("rpart")
##D models <- caretList(
##D   x=iris[1:100,1:2],
##D   y=iris[1:100,3],
##D   trControl=trainControl(method="cv"),
##D   methodList=c("rpart", "glm")
##D )
##D meta_model <- caretStack(models, method="rpart", tuneLength=2)
##D plot(meta_model)
## End(Not run)



