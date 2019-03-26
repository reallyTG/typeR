library(Rdimtools)


### Name: oos.linear
### Title: Out-Of-Sample Prediction for Linear Methods
### Aliases: oos.linear

### ** Examples

## Not run: 
##D ## generate sample data and separate them
##D X = aux.gensamples(n=500)
##D set.seed(46556)
##D idxtest  = sample(1:500,20)        # 20% of data for testing
##D idxtrain = setdiff(1:500,idxtest)  # 80% of data for training
##D 
##D Xtrain = X[idxtrain,]
##D Xtest  = X[idxtest,]
##D 
##D ## run PCA for train data
##D res_train = do.pca(Xtrain,ndim=2,preprocess="whiten")
##D 
##D ## perform OOS.LINEAR on new dataset
##D ## note that inputs should be from a given model you trained
##D model.projection = res_train$projection
##D model.trfinfo    = res_train$trfinfo
##D res_test  = oos.linear(Xtest, model.projection, model.trfinfo)
##D 
##D ## let's compare via visualization
##D xx = c(-2,2) # range of axis 1 for compact visualization
##D yy = c(-2,2) # range of axis 2 for compact visualization
##D mm = "black=train / red=test data" # figure title
##D YY = res_test$Ynew  # out-of-sample projection for test data
##D 
##D plot(res_train$Y[,1], res_train$Y[,2], type="p", xlim=xx, ylim=yy,
##D main=mm, xlab="axis 1", ylab="axis 2")
##D par(new=TRUE)
##D plot(YY[,1], YY[,2], type="p", lwd=3, col="red", xlim=xx, ylim=yy, xlab="", ylab="")
## End(Not run)




