library(bmrm)


### Name: softMarginVectorLoss
### Title: Soft Margin Vector Loss function for multiclass SVM
### Aliases: softMarginVectorLoss

### ** Examples

  # -- Build a 2D dataset from iris, and add an intercept
  x <- cbind(intercept=100,data.matrix(iris[c(1,2)]))
  y <- iris$Species
  
  # -- build the multiclass SVM model
  w <- nrbm(softMarginVectorLoss(x,y))
  table(predict(w,x),y)
  
  # -- Plot the dataset, the decision boundaries, the convergence curve, and the predictions
  gx <- seq(min(x[,2]),max(x[,2]),length=200) # positions of the probes on x-axis
  gy <- seq(min(x[,3]),max(x[,3]),length=200) # positions of the probes on y-axis
  Y <- outer(gx,gy,function(a,b) {predict(w,cbind(100,a,b))})
  image(gx,gy,unclass(Y),asp=1,main="dataset & decision boundaries",
        xlab=colnames(x)[2],ylab=colnames(x)[3])
  points(x[,-1],pch=19+as.integer(y))



