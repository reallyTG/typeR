library(caretEnsemble)


### Name: dotplot.caretStack
### Title: Comparison dotplot for a caretStack object
### Aliases: dotplot.caretStack

### ** Examples

## Not run: 
##D set.seed(42)
##D library("rpart")
##D models <- caretList(
##D   x=iris[1:100,1:2],
##D   y=iris[1:100,3],
##D   trControl=trainControl(method="cv"),
##D   methodList=c("rpart", "glm")
##D )
##D meta_model <- caretStack(models, method="lm", trControl=trainControl(method="cv"))
##D dotplot.caretStack(meta_model)
## End(Not run)



