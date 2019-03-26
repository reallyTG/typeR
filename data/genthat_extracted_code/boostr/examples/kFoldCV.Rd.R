library(boostr)


### Name: kFoldCV
### Title: Generic k-fold Cross Validation wrapper
### Aliases: kFoldCV

### ** Examples

# simple example with k-NN where we can build our own wrapper
library(class)
data(iris)
.iris <- iris[, 5:1] # put response as first column

# make a wrapper for class::knn
f <- function(data, newdata, k) {
  preds <- knn(train=data[,-1],
               test=newdata[, -1],
               cl=data[, 1],
               k=k)
  mean(preds==newdata[, 1])
}

params <- list(k=c(1,3,5,7))

accuracy <- kFoldCV(f, 10, .iris, params, .rngSeed=407)

data.frame(expand.grid(params), accuracy=accuracy)

# look at a more complicated example:
# cross validate an svm with different kernels and different models
require(e1071)
g <- function(data, newdata, kernel, cost, gamma, formula) {
  kern <- switch(kernel, "linear", "radial", stop("invalid kernel"))
  form <- switch(formula,
                 as.formula(Species ~ .),
                 as.formula(Species ~ Petal.Length + Petal.Width),
                 as.formula(Petal.Length ~ .),
                 stop('invalid formula'))

   svmWrapper <- function(data, newdata, kernel, cost, gamma, form) {
                   svmObj <- svm(formula=form, data=data, kernel=kernel,
                                 cost=cost, gamma=gamma)
                   predict(svmObj, newdata)
                 }
  preds <- svmWrapper(data, newdata, kernel=kern, cost=cost,
                      gamma=gamma, form=form)

  if (formula != 3) {
    mean(preds == newdata[["Species"]])
  } else {
    mean((preds - newdata[["Petal.Length"]])^2)
  }
}

params <- list(kernel=1:2, cost=c(10,50), gamma=0.01, formula=1)
accuracy <- kFoldCV(g, 10, iris, params)
data.frame(expand.grid(params), metric=accuracy)



