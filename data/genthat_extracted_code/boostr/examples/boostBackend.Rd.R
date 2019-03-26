library(boostr)


### Name: boostBackend
### Title: Boost an estimation procedure with a reweighter and aggregator.
### Aliases: boostBackend

### ** Examples

## Not run: 
##D df <- within(iris, {
##D               Setosa <- factor(2*as.numeric(Species == "setosa") - 1)
##D               Species <- NULL
##D              })
##D 
##D form <- formula(Setosa ~ . )
##D df <- model.frame(formula=form, data=df)
##D 
##D # demonstrate arc-fs algorithm using boostr convenience functions
##D 
##D glmArgs <- list(.trainArgs=list(formula=form, family="binomial"))
##D 
##D # format prediction to yield response in {-1,1} instead of {0,1}
##D glm_predict <- function(object, newdata) {
##D   2*round(predict(object, newdata, type='response')) - 1
##D   }
##D 
##D Phi_glm <- buildEstimationProcedure(train=glm, predict=glm_predict)
##D 
##D phi <- boostBackend(B=3, data=df,
##D                      reweighter=adaboostReweighter,
##D                      aggregator=adaboostAggregator,
##D                      proc=Phi_glm,
##D                      .procArgs=glmArgs)
## End(Not run)



