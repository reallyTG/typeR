library(ROSE)


### Name: ROSE.eval
### Title: Evaluation of learner accuracy by ROSE
### Aliases: ROSE.eval
### Keywords: bootstrap

### ** Examples


# 2-dimensional data
# loading data
data(hacide)

# in the following examples 
# use of a small subset of observations only --> argument subset

dat <- hacide.train

table(dat$cls)

##Example 1
# classification with logit model
# arguments to glm are passed through control.learner
# leave-one-out cross-validation estimate of auc of classifier
# trained on balanced data
ROSE.eval(cls~., data=dat, glm, subset=c(1:50, 981:1000), 
          method.assess="LKOCV", K=5,
          control.learner=list(family=binomial), seed=1)

## Not run: 
##D ##Example 2
##D # classification with decision tree 
##D # require package rpart
##D library(rpart)
##D 
##D # function is needed to extract predicted probability of cls 1 
##D f.pred.rpart <- function(x) x[,2]
##D 
##D # holdout estimate of auc of two classifiers
##D 
##D # first classifier trained on ROSE unbalanced sample
##D # proportion of rare events in original data
##D p <- (table(dat$cls)/sum(table(dat$cls)))[2]
##D ROSE.eval(cls~., data=dat, rpart, subset=c(1:50, 981:1000),
##D           control.rose=list(p = p), extr.pred=f.pred.rpart, seed=1)
##D 
##D # second classifier trained on ROSE balanced sample
##D # optional arguments to plot the roc.curve are passed through 
##D # control.accuracy 
##D ROSE.eval(cls~., data=dat, rpart, subset=c(1:50, 981:1000), 
##D           control.rose=list(p = 0.5), control.accuracy = list(add.roc = TRUE, 
##D           col = 2), extr.pred=f.pred.rpart, seed=1)
##D 
##D ##Example 3
##D # classification with linear discriminant analysis
##D library(MASS)
##D 
##D # function is needed to extract the predicted values from predict.lda
##D f.pred.lda <- function(z) z$posterior[,2]
##D 
##D # bootstrap estimate of precision of learner trained on balanced data
##D prec.distr <- ROSE.eval(cls~., data=dat, lda, subset=c(1:50, 981:1000), 
##D                         extr.pred=f.pred.lda, acc.measure="precision",
##D                         method.assess="BOOT", B=100, trace=TRUE)
##D 
##D summary(prec.distr)
##D 
##D ##Example 4
##D # compare auc of classification with neural network
##D # with auc of classification with tree 
##D # require package nnet
##D # require package tree
##D 
##D library(nnet)
##D library(tree)
##D 
##D # optional arguments to nnet are passed through control.learner 
##D ROSE.eval(cls~., data=dat, nnet, subset=c(1:50, 981:1000), 
##D           method.assess="holdout", control.learn=list(size=1), seed=1)
##D 
##D # optional arguments to plot the roc.curve are passed through 
##D # control.accuracy
##D # a function is needed to extract predicted probability of class 1 
##D f.pred.rpart <- function(x) x[,2] 
##D f.pred.tree  <- function(x) x[,2] 
##D ROSE.eval(cls~., data=dat, tree, subset=c(1:50, 981:1000), 
##D           method.assess="holdout", extr.pred=f.pred.tree, 
##D           control.acc=list(add=TRUE, col=2), seed=1)
##D 
##D ##Example 5
##D # An user defined learner with a standard behavior
##D # Consider a dummy example for illustrative purposes only
##D # Note that function name and the name of the class returned match
##D DummyStump <- function(formula, ...)
##D {
##D    mc <- match.call()
##D    m <- match(c("formula", "data", "na.action", "subset"), names(mc), 0L)
##D    mf <- mc[c(1L, m)]
##D    mf[[1L]] <- as.name("model.frame")
##D    mf <- eval(mf, parent.frame())  
##D    data.st <- data.frame(mf)
##D    out <- list(colname=colnames(data.st)[2], threshold=1)
##D    class(out) <- "DummyStump"
##D    out
##D }
##D 
##D # Associate to DummyStump a predict method
##D # Usual S3 definition: predic.classname
##D predict.DummyStump <- function(object, newdata)
##D {
##D    out <- newdata[,object$colname]>object$threshold
##D    out
##D }
##D 
##D ROSE.eval(formula=cls~., data=dat, learner=DummyStump, 
##D           subset=c(1:50, 981:1000), method.assess="holdout", seed=3)
##D 
##D 
##D ##Example 6
##D # The use of the wrapper for a function with non standard behaviour
##D # Consider knn in package class
##D # require package class
##D 
##D library(class)
##D 
##D # the wrapper require two mandatory arguments: data, newdata.
##D # optional arguments can be passed by including the object '...'
##D # note that we are going to specify data=data in ROSE.eval
##D # therefore data in knn.wrap will receive a data set structured
##D # as dat as well as newdata but with the class label variable dropped
##D # note that inside the wrapper we dispense to knn 
##D # the needed quantities accordingly
##D 
##D knn.wrap <- function(data, newdata, ...)
##D {
##D    knn(train=data[,-1], test=newdata, cl=data[,1], ...)
##D }
##D 
##D # optional arguments to knn.wrap may be specified in control.learner
##D ROSE.eval(formula=cls~., data=dat, learner=knn.wrap,
##D           subset=c(1:50, 981:1000), method.assess="holdout", 
##D           control.learner=list(k=2, prob=T), seed=1)
##D 
##D # if we swap the columns of dat we have to change the wrapper accordingly
##D dat <- dat[,c("x1","x2","cls")]
##D 
##D # now class label variable is the last one
##D knn.wrap <- function(data, newdata, ...)
##D {
##D    knn(train=data[,-3], test=newdata, cl=data[,3], ...)
##D }
##D 
##D ROSE.eval(formula=cls~., data=dat, learner=knn.wrap,
##D           subset=c(1:50, 981:1000), method.assess="holdout", 
##D           control.learner=list(k=2, prob=T), seed=1)
##D 
## End(Not run)



