library(ssc)


### Name: democraticG
### Title: Democratic generic method
### Aliases: democraticG

### ** Examples


## Not run: 
##D # this is a long running example
##D 
##D library(ssc)
##D 
##D ## Load Wine data set
##D data(wine)
##D 
##D cls <- which(colnames(wine) == "Wine")
##D x <- wine[, -cls] # instances without classes
##D y <- wine[, cls] # the classes
##D x <- scale(x) # scale the attributes
##D 
##D ## Prepare data
##D set.seed(20)
##D # Use 50% of instances for training
##D tra.idx <- sample(x = length(y), size = ceiling(length(y) * 0.5))
##D xtrain <- x[tra.idx,] # training instances
##D ytrain <- y[tra.idx]  # classes of training instances
##D # Use 70% of train instances as unlabeled set
##D tra.na.idx <- sample(x = length(tra.idx), size = ceiling(length(tra.idx) * 0.7))
##D ytrain[tra.na.idx] <- NA # remove class information of unlabeled instances
##D 
##D # Use the other 50% of instances for inductive testing
##D tst.idx <- setdiff(1:length(y), tra.idx)
##D xitest <- x[tst.idx,] # testing instances
##D yitest <- y[tst.idx] # classes of testing instances
##D 
##D ## Example A: 
##D # Training from a set of instances with 
##D # 1-NN and C-svc (SVM) as base classifiers.
##D 
##D ### Define knn base classifier using knn3 from caret package
##D library(caret)
##D # learner function
##D knn <- function(indexes, cls) {
##D   knn3(x = xtrain[indexes, ], y = cls, k = 1)
##D }
##D # function to predict probabilities
##D knn.prob <- function(model, indexes) {
##D   predict(model, xtrain[indexes, ])
##D }
##D 
##D ### Define svm base classifier using ksvm from kernlab package
##D library(kernlab)
##D library(proxy)
##D # learner function
##D svm <- function(indexes, cls) {
##D   rbf <- function(x, y) {
##D     sigma <- 0.048
##D     d <- dist(x, y, method = "Euclidean", by_rows = FALSE)
##D     exp(-sigma *  d * d)
##D   }
##D   class(rbf) <- "kernel"
##D   ksvm(x = xtrain[indexes, ], y = cls, scaled = FALSE,
##D        type = "C-svc",  C = 1,
##D        kernel = rbf, prob.model = TRUE)
##D }
##D # function to predict probabilities
##D svm.prob <- function(model, indexes) {
##D   predict(model, xtrain[indexes, ], type = "probabilities")
##D }
##D 
##D ### Train
##D m1 <- democraticG(y = ytrain, 
##D                   gen.learners = list(knn, svm),
##D                   gen.preds = list(knn.prob, svm.prob))
##D ### Predict
##D # predict labels using each classifier
##D m1.pred1 <- predict(m1$model[[1]], xitest, type = "class")
##D m1.pred2 <- predict(m1$model[[2]], xitest)
##D # combine predictions
##D m1.pred <- list(m1.pred1, m1.pred2)
##D cls1 <- democraticCombine(m1.pred, m1$W, m1$classes)
##D table(cls1, yitest)
##D 
##D ## Example B: 
##D # Training from a distance matrix and a kernel matrix with 
##D # 1-NN and C-svc (SVM) as base classifiers.
##D 
##D ### Define knn2 base classifier using oneNN from ssc package
##D library(ssc)
##D # Compute distance matrix D
##D # D is used in knn2.prob
##D D <- as.matrix(dist(x = xtrain, method = "euclidean", by_rows = TRUE))
##D # learner function
##D knn2 <- function(indexes, cls) {
##D   model <- oneNN(y = cls)
##D   attr(model, "tra.idxs") <- indexes
##D   model
##D }
##D # function to predict probabilities
##D knn2.prob <- function(model, indexes)  {
##D   tra.idxs <- attr(model, "tra.idxs")
##D   predict(model, D[indexes, tra.idxs], distance.weighting = "none")
##D }
##D 
##D ### Define svm2 base classifier using ksvm from kernlab package
##D library(kernlab)
##D 
##D # Compute kernel matrix K
##D # K is used in svm2 and svm2.prob functions
##D sigma <- 0.048
##D K <- exp(- sigma * D * D)
##D 
##D # learner function
##D svm2 <- function(indexes, cls) {
##D   model <- ksvm(K[indexes, indexes], y = cls, 
##D                 type = "C-svc", C = 1,
##D                 kernel = "matrix", 
##D                 prob.model = TRUE)
##D   attr(model, "tra.idxs") <- indexes
##D   model
##D }
##D # function to predict probabilities
##D svm2.prob <- function(model, indexes)  {
##D   tra.idxs <- attr(model, "tra.idxs")
##D   sv.idxs <- tra.idxs[SVindex(model)]
##D   predict(model, 
##D           as.kernelMatrix(K[indexes, sv.idxs]),
##D           type = "probabilities") 
##D }
##D 
## End(Not run)




