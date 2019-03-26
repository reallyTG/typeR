library(extraTrees)


### Name: extraTrees
### Title: Function for training ExtraTree classifier or regression.
### Aliases: extraTrees extraTrees.default
### Keywords: regression,classification,trees

### ** Examples

  ## Regression with ExtraTrees:
  n <- 1000  ## number of samples
  p <- 5     ## number of dimensions
  x <- matrix(runif(n*p), n, p)
  y <- (x[,1]>0.5) + 0.8*(x[,2]>0.6) + 0.5*(x[,3]>0.4) +
       0.1*runif(nrow(x))
  et <- extraTrees(x, y, nodesize=3, mtry=p, numRandomCuts=2)
  yhat <- predict(et, x)
  
  #######################################
  ## Multi-task regression with ExtraTrees:
  n <- 1000  ## number of samples
  p <- 5     ## number of dimensions
  x <- matrix(runif(n*p), n, p)
  task <- sample(1:10, size=n, replace=TRUE)
  ## y depends on the task: 
  y <- 0.5*(x[,1]>0.5) + 0.6*(x[,2]>0.6) + 0.8*(x[cbind(1:n,(task %% 2) + 3)]>0.4)
  et <- extraTrees(x, y, nodesize=3, mtry=p-1, numRandomCuts=2, tasks=task)
  yhat <- predict(et, x, newtasks=task)
  
  #######################################
  ## Classification with ExtraTrees (with test data)
  make.data <- function(n) {
    p <- 4
    f <- function(x) (x[,1]>0.5) + (x[,2]>0.6) + (x[,3]>0.4)
    x <- matrix(runif(n*p), n, p)
    y <- as.factor(f(x))
    return(list(x=x, y=y))
  }
  train <- make.data(800)
  test  <- make.data(500)
  et    <- extraTrees(train$x, train$y)
  yhat  <- predict(et, test$x)
  ## accuracy
  mean(test$y == yhat)
  ## class probabilities
  yprob = predict(et, test$x, probability=TRUE)
  head(yprob)
  
  #######################################
  ## Quantile regression with ExtraTrees (with test data)
  make.qdata <- function(n) {
    p <- 4
    f <- function(x) (x[,1]>0.5) + 0.8*(x[,2]>0.6) + 0.5*(x[,3]>0.4)
    x <- matrix(runif(n*p), n, p)
    y <- as.numeric(f(x))
    return(list(x=x, y=y))
  }
  train <- make.qdata(400)
  test  <- make.qdata(200)
  
  ## learning extra trees:
  et <- extraTrees(train$x, train$y, quantile=TRUE)
  ## estimate median (0.5 quantile)
  yhat0.5 <- predict(et, test$x, quantile = 0.5)
  ## estimate 0.8 quantile (80%)
  yhat0.8 <- predict(et, test$x, quantile = 0.8)


  #######################################
  ## Weighted regression with ExtraTrees 
  make.wdata <- function(n) {
    p <- 4
    f <- function(x) (x[,1]>0.5) + 0.8*(x[,2]>0.6) + 0.5*(x[,3]>0.4)
    x <- matrix(runif(n*p), n, p)
    y <- as.numeric(f(x))
    return(list(x=x, y=y))
  }
  train <- make.wdata(400)
  test  <- make.wdata(200)
  
  ## first half of the samples have weight 1, rest 0.3
  weights <- rep(c(1, 0.3), each = nrow(train$x) / 2)
  et <- extraTrees(train$x, train$y, weights = weights, numRandomCuts = 2)
  ## estimates of the weighted model
  yhat <- predict(et, test$x)



