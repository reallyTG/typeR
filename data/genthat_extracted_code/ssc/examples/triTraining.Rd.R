library(ssc)


### Name: triTraining
### Title: Tri-training method
### Aliases: triTraining

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

## Example: Training from a set of instances with 1-NN as base classifier.
set.seed(1)
m1 <- triTraining(x = xtrain, y = ytrain, 
                  learner = caret::knn3, 
                  learner.pars = list(k = 1),
                  pred = "predict")
pred1 <- predict(m1, xitest)
table(pred1, yitest)

## Example: Training from a distance matrix with 1-NN as base classifier.
dtrain <- proxy::dist(x = xtrain, method = "euclidean", by_rows = TRUE)
set.seed(1)
m2 <- triTraining(x = dtrain, y = ytrain, x.inst = FALSE,
                  learner = ssc::oneNN, 
                  pred = "predict",
                  pred.pars = list(distance.weighting = "none"))
ditest <- proxy::dist(x = xitest, y = xtrain[m2$instances.index,],
                      method = "euclidean", by_rows = TRUE)
pred2 <- predict(m2, ditest)
table(pred2, yitest)

## Example: Training from a set of instances with SVM as base classifier.
learner <- e1071::svm
learner.pars <- list(type = "C-classification", kernel="radial", 
                     probability = TRUE, scale = TRUE)
pred <- function(m, x){
  r <- predict(m, x, probability = TRUE)
  prob <- attr(r, "probabilities")
  prob
}
set.seed(1)
m3 <- triTraining(x = xtrain, y = ytrain, 
                  learner = learner, 
                  learner.pars = learner.pars, 
                  pred = pred)
pred3 <- predict(m3, xitest)
table(pred3, yitest)

## Example: Training from a set of instances with Naive-Bayes as base classifier.
set.seed(1)
m4 <- triTraining(x = xtrain, y = ytrain, 
                  learner = function(x, y) e1071::naiveBayes(x, y), 
                  pred.pars = list(type = "raw"))
pred4 <- predict(m4, xitest)
table(pred4, yitest)

## Example: Training from a set of instances with C5.0 as base classifier.
set.seed(1)
m5 <- triTraining(x = xtrain, y = ytrain, 
                  learner = C50::C5.0, 
                  pred.pars = list(type = "prob"))
pred5 <- predict(m5, xitest)
table(pred5, yitest)





