library(caretEnsemble)


### Name: caretList
### Title: Create a list of several train models from the caret package
###   Build a list of train objects suitable for ensembling using the
###   'caretEnsemble' function.
### Aliases: caretList

### ** Examples

## Not run: 
##D myControl <- trainControl(method="cv", number=5)
##D caretList(
##D   Sepal.Length ~ Sepal.Width,
##D   head(iris, 50),
##D   methodList=c("glm", "lm"),
##D   trControl=myControl
##D   )
##D caretList(
##D   Sepal.Length ~ Sepal.Width,
##D   head(iris, 50), methodList=c("lm"),
##D   tuneList=list(
##D     nnet=caretModelSpec(method="nnet", trace=FALSE, tuneLength=1)
##D  ),
##D   trControl=myControl
##D   )
##D   
## End(Not run)



