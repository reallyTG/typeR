library(ssc)


### Name: democratic
### Title: Democratic method
### Aliases: democratic

### ** Examples


library(ssc)

## Load Wine data set
data(wine)

cls <- which(colnames(wine) == "Wine")
x <- wine[, -cls] # instances without classes
y <- wine[, cls] # the classes
x <- scale(x) # scale the attributes

## Prepare data
set.seed(20)
# Use 50% of instances for training
tra.idx <- sample(x = length(y), size = ceiling(length(y) * 0.5))
xtrain <- x[tra.idx,] # training instances
ytrain <- y[tra.idx]  # classes of training instances
# Use 70% of train instances as unlabeled set
tra.na.idx <- sample(x = length(tra.idx), size = ceiling(length(tra.idx) * 0.7))
ytrain[tra.na.idx] <- NA # remove class information of unlabeled instances

# Use the other 50% of instances for inductive testing
tst.idx <- setdiff(1:length(y), tra.idx)
xitest <- x[tst.idx,] # testing instances
yitest <- y[tst.idx] # classes of testing instances

## Example: Training from a set of instances with 
# 1-NN and C-svc (SVM) as base classifiers.
# knn3 learner
library(caret)
knn <- knn3             # learner function
knn.pars <- list(k = 1) # parameters for learner function
knn.prob <- predict     # function to predict probabilities
knn.prob.pars <- NULL   # parameters for prediction function

# ksvm learner
library(kernlab)
svm <- ksvm             # learner function
svm.pars <- list(       # parameters for learner function
  type = "C-svc",  C = 1, 
  kernel = "rbfdot", kpar = list(sigma = 0.048),
  prob.model = TRUE,
  scaled = FALSE
)
svm.prob <- predict     # function to predict probabilities
svm.prob.pars <- list(  # parameters for prediction function
  type = "probabilities"
)

# train a model
m <- democratic(x = xtrain, y = ytrain, 
                learners = list(knn, svm), 
                learners.pars = list(knn.pars, svm.pars), 
                preds = list(knn.prob, svm.prob), 
                preds.pars = list(knn.prob.pars, svm.prob.pars))
# predict classes
m.pred <- predict(m, xitest)
table(m.pred, yitest)




