library(A3)


### Name: a3
### Title: A3 Results for Arbitrary Model
### Aliases: a3

### ** Examples

## No test: 
 ## Standard linear regression results:

 summary(lm(rating ~ ., attitude))

 ## A3 Results for a Linear Regression model:

 # In practice, p.acc should be <= 0.01 in order
 # to obtain finer grained p values.

 a3(rating ~ ., attitude, lm, p.acc = 0.1)


 ## A3 Results for a Random Forest model:

 # It is important to include the "+0" in the formula
 # to eliminate the constant term.

 require(randomForest)
 a3(rating ~ .+0, attitude, randomForest, p.acc = 0.1)

 # Set the ntrees argument of the randomForest function to 100

 a3(rating ~ .+0, attitude, randomForest, p.acc = 0.1, model.args = list(ntree = 100))

 # Speed up the calculation by doing 5-fold cross-validation.
 # This is faster and more conservative (i.e. it should over-estimate error)

 a3(rating ~ .+0, attitude, randomForest, n.folds = 5, p.acc = 0.1)

 # Use Leave One Out Cross Validation. The least biased approach,
 # but, for large data sets, potentially very slow.

 a3(rating ~ .+0, attitude, randomForest, n.folds = 0, p.acc = 0.1)

 ## Use a Support Vector Machine algorithm.

 # Just calculate the slopes and R^2 values, do not calculate p values.

 require(e1071)
 a3(rating ~ .+0, attitude, svm, p.acc = NULL)
 
## End(No test)



