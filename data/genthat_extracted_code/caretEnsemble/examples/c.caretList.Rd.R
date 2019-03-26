library(caretEnsemble)


### Name: c.caretList
### Title: S3 definition for concatenating caretList
### Aliases: c.caretList

### ** Examples

## Not run: 
##D  model_list1 <- caretList(Class ~ .,
##D   data=Sonar, trControl = ctrl1,
##D   tuneList = list(
##D                  glm=caretModelSpec(method='glm', family='binomial'),
##D                  rpart=caretModelSpec(method='rpart')
##D                  ),
##D    metric='ROC')
##D 
##D model_list2 <- caretList(Class ~ .,
##D                          data=Sonar,
##D                          trControl = ctrl1,
##D                          tuneList = list(
##D                            glm=caretModelSpec(method='rpart'),
##D                            rpart=caretModelSpec(method='rf')
##D                          ),
##D                          metric='ROC')
##D 
##D  bigList <- c(model_list1, model_list2)
## End(Not run)




