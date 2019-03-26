library(Rdimtools)


### Name: oos.linproj
### Title: OOS : Linear Projection
### Aliases: oos.linproj

### ** Examples

## Not run: 
##D ## generate sample data and separate them
##D X = aux.gensamples(n=500)
##D set.seed(46556)
##D idxselect  = sample(1:500,20)
##D 
##D Xold = X[setdiff(1:500,idxselect),]  # 80% of data for training
##D Xnew = X[idxselect,]                 # 20% of data for testing
##D 
##D ## run PCA for train data
##D training = do.pca(Xold,ndim=2,preprocess="whiten")
##D Yold     = training$Y       # embedded data points
##D oldinfo  = training$trfinfo # preprocessing information
##D 
##D ## perform out-of-sample extension
##D output  = oos.linproj(Xold, Yold, oldinfo, Xnew)
##D Ynew    = output$Ynew
##D 
##D ## let's compare via visualization
##D xx = c(-2,2) # range of axis 1 for compact visualization
##D yy = c(-2,2) # range of axis 2 for compact visualization
##D mm = "black=train / red=test data" # figure title
##D 
##D plot(Yold[,1], Yold[,2], type="p", xlim=xx, ylim=yy, main=mm, xlab="axis 1", ylab="axis 2")
##D par(new=TRUE)
##D plot(Ynew[,1], Ynew[,2], type="p", lwd=3, col="red", xlim=xx, ylim=yy, xlab="", ylab="")
## End(Not run)




