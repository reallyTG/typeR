library(gensemble)


### Name: gensemble
### Title: Generalized ensemble methods
### Aliases: gensemble print.gensemble

### ** Examples

## Not run: 
##D #classification with kernlab
##D library(kernlab)
##D #make our abstract model object
##D abm <- ab.create(model.call="ksvm", model.args=list(prob.model=TRUE, 
##D 	type="C-svc", C=1, epsilon=0.1), predict.args=list(type="probabilities"), 
##D 	xtrans=as.matrix)
##D #the example data
##D X <- iris[,1:4]
##D Y <- iris[,5]
##D #create a training/test set
##D samp <- sample(1:nrow(iris), nrow(iris) * 0.8)        
##D #train the model
##D gmod <- gensemble(abm, X[samp,], Y[samp], sampsize=0.8, sampsize_prop=TRUE)
##D #test it out
##D gpreds <- predict(gmod, X[-samp,])
##D #compare
##D cbind(apply(gpreds, 1, which.max), Y[-samp])
##D 
##D 
##D #regression with rpart
##D library(rpart)
##D abm <- ab.create(model.call="rpart", model.args=list(control=rpart.control(minsplit=2)))
##D X <- trees[,1:2]
##D Y <- trees[,3]
##D #generate a training set
##D samp <- sample(1:nrow(trees), nrow(trees) * 0.8)
##D #build the model
##D gmod <- gensemble(abm, X[samp,], Y[samp])
##D #use it to predict with the test set
##D gpreds <- predict(gmod, X[-samp,])
##D #compare
##D cbind(gpreds, Y[-samp])
## End(Not run)



