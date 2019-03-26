library(gensemble)


### Name: AbstractModel-class
### Title: Class '"AbstractModel"'
### Aliases: AbstractModel-class
### Keywords: classes

### ** Examples

## Not run: 
##D #ksvm classification
##D library(kernlab)
##D #note we pass prob.model=TRUE as gensemble requires the probabilities for classification.
##D ksvm_model_args <- list(prob.model=TRUE, type="C-svc", C=1, epsilon=0.1)
##D #create the abstract model instance
##D abm <- ab.create(model.call="ksvm", model.args=ksvm_model_args, predict.args=list(type="probabilities"), xtrans=as.matrix)
##D 
##D #nnet classification
##D library(nnet)
##D #use the formula
##D abm <- ab.create(model.call="nnet", model.args=list(size=3), formula=TRUE)
##D 
##D #rpart classification
##D library(rpart)
##D abm <- ab.create(model.call="rpart", model.args=list(control=rpart.control(minsplit=0)), predict.args=list(type='prob'))
##D 
##D #classification test stub (try with the different abm's from above)
##D X <- iris[,1:4]
##D Y <- iris[,5]
##D #generate train/test samples
##D cnt <- nrow(iris)
##D samp <- sample(1:cnt, cnt * 0.7, rep=FALSE)
##D #train the model
##D mod <- ab.model(abm, X[samp,], Y[samp])
##D #get the predictions
##D preds <- ab.predict(abm, mod, X[-samp,])
##D #compare to actual classes
##D cbind(apply(preds, 1, which.max), Y[-samp])
##D 
##D #ksvm regression
##D library(kernlab)
##D abm <- ab.create(model.call="ksvm", xtrans=as.matrix)
##D 
##D #nnet regression
##D library(nnet)
##D abm <- ab.create(model.call="nnet", model.args=list(size=3, linout=TRUE, maxit=400, rang=0.001, decay=0.0001), xtrans=as.matrix)
##D 
##D #rpart regression
##D library(rpart)
##D abm <- ab.create(model.call="rpart", model.args=list(method='anova', control=rpart.control(minsplit=2, cp=1e-03)))
##D 
##D #regression test stub
##D X <- trees[,1:2]
##D Y <- trees[,3]
##D #generate train/test samples
##D cnt <- nrow(trees)
##D samp <- sample(1:cnt, cnt * 0.7, rep=FALSE)
##D #build the model
##D mod <- ab.model(abm, X[samp,], Y[samp])
##D #try some predictions
##D preds <- ab.predict(abm, mod, X[-samp,])
##D #compare vs actual values
##D cbind(preds, Y[-samp])
## End(Not run)



