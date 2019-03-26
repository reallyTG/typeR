library(e1071)


### Name: tune
### Title: Parameter Tuning of Functions Using Grid Search
### Aliases: tune best.tune print.tune summary.tune print.summary.tune
### Keywords: models

### ** Examples

  data(iris)
  ## tune `svm' for classification with RBF-kernel (default in svm),
  ## using one split for training/validation set
  
  obj <- tune(svm, Species~., data = iris, 
              ranges = list(gamma = 2^(-1:1), cost = 2^(2:4)),
              tunecontrol = tune.control(sampling = "fix")
             )

  ## alternatively:
  ## obj <- tune.svm(Species~., data = iris, gamma = 2^(-1:1), cost = 2^(2:4))

  summary(obj)
  plot(obj)

  ## tune `knn' using a convenience function; this time with the
  ## conventional interface and bootstrap sampling:
  x <- iris[,-5]
  y <- iris[,5]
  obj2 <- tune.knn(x, y, k = 1:5, tunecontrol = tune.control(sampling = "boot"))
  summary(obj2)
  plot(obj2)

  ## tune `rpart' for regression, using 10-fold cross validation (default)
  data(mtcars)
  obj3 <- tune.rpart(mpg~., data = mtcars, minsplit = c(5,10,15))
  summary(obj3)
  plot(obj3)

  ## simple error estimation for lm using 10-fold cross validation
  tune(lm, mpg~., data = mtcars)



