library(bmrm)


### Name: nrbm
### Title: Convex and non-convex risk minimization with L2 regularization
###   and limited memory
### Aliases: nrbm nrbm nrbmL1

### ** Examples

  # -- Create a 2D dataset with the first 2 features of iris, with binary labels
  x <- data.matrix(iris[1:2])

  # -- Add a constant dimension to the dataset to learn the intercept
  x <- cbind(intercept=1000,x)

  # -- train scalar prediction models with maxMarginLoss and fbetaLoss
  models <- list(
    svm_L1 = nrbmL1(hingeLoss(x,iris$Species=="setosa"),LAMBDA=1),
    svm_L2 = nrbm(hingeLoss(x,iris$Species=="setosa"),LAMBDA=1),
    f1_L1 = nrbmL1(fbetaLoss(x,iris$Species=="setosa"),LAMBDA=1),
    tsvm_L2 = nrbm(tsvmLoss(x,
                   ifelse(iris$Species=="versicolor",NA,iris$Species=="setosa")),
                   LAMBDA=1)
  )

  # -- Plot the dataset and the predictions
  plot(x[,-1],pch=ifelse(iris$Species=="setosa",1,2),main="dataset & hyperplanes")
  legend('bottomright',legend=names(models),col=seq_along(models),lty=1,cex=0.75,lwd=3)
  for(i in seq_along(models)) {
    w <- models[[i]]
    if (w[3]!=0) abline(-w[1]*1000/w[3],-w[2]/w[3],col=i,lwd=3)
  }


  # -- fit a least absolute deviation linear model on a synthetic dataset
  # -- containing 196 meaningful features and 4 noisy features. Then
  # -- check if the model has detected the noise
  set.seed(123)
  X <- matrix(rnorm(4000*200), 4000, 200)
  beta <- c(rep(1,ncol(X)-4),0,0,0,0)
  Y <- X%*%beta + rnorm(nrow(X))
  w <- nrbm(ladRegressionLoss(X/100,Y/100),maxCP=50)
  barplot(as.vector(w))



