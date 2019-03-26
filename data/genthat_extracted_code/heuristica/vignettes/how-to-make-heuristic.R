## ------------------------------------------------------------------------
library(heuristica)

## ------------------------------------------------------------------------
myRandModel <- function(train_data, criterion_col, cols_to_fit) {
  # We will fill in a more interesting version below.
  structure(list(criterion_col=criterion_col, cols_to_fit=cols_to_fit),
            class="myRandModel")
}

## ------------------------------------------------------------------------
predictPairInternal.myRandModel <- function(object, row1, row2) {
  prob <- runif(1)
  if (prob > 0.5) {
    return(1)
  } else {
    return(-1)
  }
}

## ------------------------------------------------------------------------
data("highschool_dropout")
schools <- highschool_dropout[c(1:5), c(1,4,6,7,11)]
schools

## ------------------------------------------------------------------------
myFit <- myRandModel(schools, 2, c(3:5))
row1 <- oneRow(schools, 1)
row1
row2 <- oneRow(schools, 2)
row2
predictPair(row1, row2, myFit)

## ------------------------------------------------------------------------
myFit <- myRandModel(schools, 2, c(3:5))
myData <- rbind(oneRow(schools, 1), oneRow(schools, 2))
rowPairApply(myData, correctGreater(2), heuristics(myFit))

## ------------------------------------------------------------------------
rowPairApply(schools, correctGreater(2), heuristics(myFit))

## ------------------------------------------------------------------------
set.seed(1)
predictions <- data.frame(rowPairApply(schools, correctGreater(2), heuristics(myFit)))
confusionMatrixFor_Neg1_0_1(predictions$CorrectGreater, predictions$myRandModel)

## ------------------------------------------------------------------------
set.seed(1)
myFit <- myRandModel(schools, 2, c(3:5))
percentCorrect(schools, myFit)

## ------------------------------------------------------------------------
# install.packages("glmnet")
library(glmnet)

## ------------------------------------------------------------------------
lassoModel <- function(train_data, criterion_col, cols_to_fit) {
  # glmnet can only handle matrices, not data.frames.
  cvfit <- suppressWarnings(cv.glmnet(y=as.matrix(train_data[,criterion_col]),
                                      x=as.matrix(train_data[,cols_to_fit])))
  # Make lassoModel a subclass.  Be sure to keep the original class, glmnet.
  class(cvfit) <- c("lassoModel", class(cvfit))
  # Functions in this package require criterion_col and cols_to_fit.
  cvfit$criterion_col <- criterion_col
  cvfit$cols_to_fit <- cols_to_fit
  return(cvfit)
}

## ------------------------------------------------------------------------
my_data <- cbind(y=c(4, 3, 2, 1), x1=c(1.2, 1.1, 1.0, 1.0), x2=c(1, 0, 1, 1))
lasso <- lassoModel(my_data, 1, c(2,3))
lasso$criterion_col
# Should output 1
lasso$cols_to_fit
# Should output 2 3
class(lasso)
# should output "lassoModel" "cv.glmnet"

## ------------------------------------------------------------------------
coef(lasso)
predict(lasso, my_data[,lasso$cols_to_fit])

## ------------------------------------------------------------------------
predictPairInternal.lassoModel <- function(object, row1, row2) {
  p1 <- predict(object, as.matrix(row1))
  p2 <- predict(object, as.matrix(row2))
  if (p1 > p2) {
    return(1)
  } else if (p1 < p2) {
    return(-1)
  } else {
    return(0)
  }
}

## ------------------------------------------------------------------------
predictPair(oneRow(my_data, 1), oneRow(my_data, 2), lasso)

## ------------------------------------------------------------------------
percentCorrect(my_data, lasso)

## ------------------------------------------------------------------------
out <- data.frame(rowPairApply(my_data, rowIndexes(), heuristics(lasso), correctGreater(lasso$criterion_col)))
out[out$lassoModel != out$CorrectGreater,]

