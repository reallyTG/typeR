library(svmplus)


### Name: SVMP
### Title: Creates and returns an instance of the class specified in the
###   svm_type.
### Aliases: SVMP

### ** Examples

# This example is similar to the example given in the section 3.3 of the article:
# https://doi.org/10.1007/s10472-017-9541-2

#Generate train data
  mean1 = rep(0, 2)
  mean2 = rep(1, 2)
  cov2  = cov1 = .5 * diag(2)
  n = 20
  X1 = mvrnorm(n, mean1, Sigma = cov1)
  X2 = mvrnorm(n, mean2, Sigma = cov2)
  X_train = rbind(X1, X2)
  y_train = matrix(c(rep(1, n), rep(-1, n)), 2*n, 1)
# geberate privileged information data
  X1Star = matrix(0, n, 2)
  X2Star = matrix(0, n, 2)
  for(i in 1:n)
  {
    X1Star[i, 1] = norm(X1[i,] - mean1, type = "2")
    X1Star[i, 2] = norm(X2[i,] - mean2, type = "2")
  }
  for(i in 1:n)
  {
    X2Star[i, 1] = norm(X1[i, ] - mean2, type = "2")
    X2Star[i, 2] = norm(X2[i, ] - mean1, type = "2")
  }
  XStar = rbind(X1Star, X2Star)
# generate test data
  n_test = 10
  X1 = mvrnorm(n_test, mean1, Sigma = cov1)
  X2 = mvrnorm(n_test, mean2, Sigma = cov2)
  X_test = rbind(X1, X2)
  y_test = matrix(c(rep(1, n_test), rep(-1, n_test)), 2*n_test, 1)
# create instance of the class type QP, using RBF kernel
  qp = SVMP(cost = 100, gamma = .01,
            kernel_x = "rbf", gamma_x = .001,
            kernel_xstar = "rbf", gamma_xstar = .001,
            tol = .00001, svm_type = "QP")
# call the fit function
  qp$fit(X_train, XStar, y_train)
# call the predict function
  y_predict = qp$predict(X_test)
  print(length(y_predict[y_predict == y_test]))
  print("correct classification out of 20")



  #using polynomial kernel
  qp = SVMP(cost = 100, gamma = .01,
            kernel_x = "poly", degree_x = 3,
            kernel_xstar = "poly", gamma_xstar = 3,
            tol = .00001)

  qp$fit(X_train, XStar, y_train)

  y_predict = qp$predict(X_test)

  print(length(y_predict[y_predict == y_test]))
  print("correct classification out of 20")

  #using linear kernel
  qp = SVMP(cost = 10, gamma = .1,
            kernel_x = "linear",
            kernel_xstar = "linear",
            tol = .00001)

  qp$fit(X_train, XStar, y_train)

  y_predict = qp$predict(X_test)

  print(length(y_predict[y_predict == y_test]))
  print("correct classification out of 20")



