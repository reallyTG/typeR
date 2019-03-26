library(magrittr)
library(testthat)
library(SVMMaj)

n = 10
k = 4
beta    <- matrix(rnorm(k + 1), ncol = 1)
X.base  <- matrix(rnorm(n * k), ncol = k) 
y.base  <- scale(X.base %*% beta[-1] + beta[1]) > 0

test_that(
  desc = "Simple linear SVM & decomposition methods", {
    
    X = cbind(X.base, X.base %*% matrix(runif(4), ncol = 1))
    y = y.base
    
    model <- list()
    for(dec in c("svd", "chol", "none"))
      model[[dec]] <- svmmaj(X, y, options = list(decomposition = dec))
    
    expect_false(
      any(duplicated(sapply(model, function(x) x$method$type))),
      info = 'test types should all be different'
    )
    
    for(i in seq_along(model[-1])){
      expect_lt(
        max(abs(model[[i]]$q - model[[i + 1]]$q)),
        1e-5,
        label = 'predicted value should be equal for all decompositions'
      )
      expect_lt(
        max(abs(model[[i]]$beta - model[[i + 1]]$beta)),
        1e-5,
        label = 'beta should be equal for all decompositions'
      )
    }
    
  }
)

test_that(
  desc = "Simple nonlinear kernels & decomposition methods", {
    
    X = X.base
    y = y.base
    
    model.svd  <- svmmaj(
      X,y, kernel = rbfdot, options = list(decomposition = 'svd'))
    model.chol <- svmmaj(
      X,y, kernel = rbfdot, options = list(decomposition = 'chol'))
    
    ## predicted values are equal
    expect_true(model.chol$method$type != model.svd$method$type)
    expect_less_than(max(abs(model.svd$q - model.chol$q)), 1e-4)
  }
)

test_that(
  desc = "Spline transformation", {
    X = X.base
    y = y.base
    
    model.svd <- svmmaj(X, y, spline.degree = 2, spline.knots = 5)
  }    
)

## Weird input
test_that(
  desc = "Checks for matching dimensions", {
    X = matrix(rnorm(50), ncol = 5)
    y = rnorm(10) > 0
    
    X_test = matrix(rnorm(50), ncol = 5)
    y_test = rnorm(9) > 0
    
    model <- svmmaj(X, y)
    
    expect_error(svmmaj(X_test, y_test), "Number of observations")
    predict(model, X)
  }
  
)
test_that(
  desc = "Can handle classes input of less than one in test set", {
    
    X = matrix(rnorm(50), ncol = 5)
    y = rnorm(10) > 0
    
    X_test = X
    y_test = rep(TRUE, 10)
    
    model <- svmmaj(X,y)
    q_pred <- predict(model, X_test, y = y_test)
    expect_equivalent(q_pred, model$q)
  }
)

test_that(
  desc = "Can handle constant attribute set", {
    
    X = matrix(1, nrow = 10) %*% matrix(1:5, nrow=1)
    X_test = matrix(1, nrow = 10) %*% matrix(2:6, nrow=1)
    #X = cbind(X, rnorm(10))
    y = rnorm(10) > 0
    y_test = rnorm(10) > 0
        
    model <- svmmaj(X,y)
    q_pred <- predict(model, X_test, y = y_test)
    expect_equivalent(q_pred, model$q)
  }
)

test_that(
 desc = "Prediction of the same input should be equal", {
   X = X.base
   y = y.base
   
   model <- svmmaj(X, y, lambda = 0.01)
   q.train <- model$q 
   q.test  <- predict(model, X, factor(y))
   expect_equivalent(q.train, q.test)
 }  
)

test_that(
  desc = "Test for case when test set lies outside of training set", {
    X = cbind(
      matrix(runif(40), ncol = 4),
      b = factor(sample(0:1, 10, .5))
    )
    y = rnorm(10) > 0.3
    
    model <- svmmaj(X,y)
    
    X_test <- cbind(
      matrix(runif(20), ncol = 4),
      b = factor(sample(0:2, 5, 0.5))
    )
    y_test = rnorm(5) > 0.4
    q <- predict(model, X_test, y_test)
  }
)

test_that(
  desc = "Example returns no majority voting", {
    example(svmmaj)
    is_maj_voting <- function(q, eps = 0.01) {
      signs <- sign(q) > 0
      min_avg <- min(mean(signs), 1 - mean(signs))
      return(min_avg < eps)
    }
    expect_equal(is_maj_voting(model1$q), FALSE)
    expect_equal(is_maj_voting(model2$q), FALSE)
    expect_equal(is_maj_voting(model3$q), FALSE)
  }          
)


