library(mlearning)


### Name: mlearning
### Title: Alternate interface to various machine learning algorithms
### Aliases: mlearning print.mlearning summary.mlearning
###   print.summary.mlearning summary.lvq print.summary.lvq plot.mlearning
###   predict.mlearning cvpredict cvpredict.mlearning mlLda mlLda.default
###   mlLda.formula predict.mlLda mlQda mlQda.default mlQda.formula
###   predict.mlQda mlRforest mlRforest.default mlRforest.formula
###   predict.mlRforest mlNnet mlNnet.default mlNnet.formula mlLvq
###   mlLvq.default mlLvq.formula predict.mlLvq mlSvm mlSvm.default
###   mlSvm.formula predict.mlSvm mlNaiveBayes mlNaiveBayes.default
###   mlNaiveBayes.formula response response.default train train.default
### Keywords: tree

### ** Examples

## Prepare data: split into training set (2/3) and test set (1/3)
data("iris", package = "datasets")
train <- c(1:34, 51:83, 101:133)
irisTrain <- iris[train, ]
irisTest <- iris[-train, ]
## One case with missing data in train set, and another case in test set
irisTrain[1, 1] <- NA
irisTest[25, 2] <- NA

data("HouseVotes84", package = "mlbench")

data(airquality, package = "datasets")

## Supervised classification using linear discriminant analysis
irLda <- mlLda(Species ~ ., data = irisTrain)
irLda
summary(irLda)
plot(irLda, col = as.numeric(response(irLda)) + 1)
predict(irLda, newdata = irisTest) # class (default type)
predict(irLda, type = "membership") # posterior probability
predict(irLda, type = "both") # both class and membership in a list
## Sometimes, other types are allowed, like for lda:
predict(irLda, type = "projection") # Projection on the LD axes
## Add test set items to the previous plot
points(predict(irLda, newdata = irisTest, type = "projection"),
    col = as.numeric(predict(irLda, newdata = irisTest)) + 1, pch = 19)

## predict() and confusion() should be used on a separate test set
## for unbiased estimation (or using cross-validation, bootstrap, ...)
confusion(irLda) # Wrong, cf. biased estimation (so-called, self-consistency)
## Estimation using a separate test set
confusion(predict(irLda, newdata = irisTest), irisTest$Species)

## Another dataset (binary predictor... not optimal for lda, just for test)
summary(res <- mlLda(Class ~ ., data = HouseVotes84, na.action = na.omit))
confusion(res) # Self-consistency
print(confusion(res), error.col = FALSE) # Without error column

## More complex formulas
summary(mlLda(Species ~ . - Sepal.Width, data = iris)) # Exclude variable
summary(mlLda(Species ~ log(Petal.Length) + log(Petal.Width) +
    I(Petal.Length/Sepal.Length), data = iris)) # With calculations

## Factor levels with missing items are allowed
ir2 <- iris[-(51:100), ] # No Iris versicolor in the training set
summary(res <- mlLda(Species ~ ., data = ir2)) # virginica is NOT there
## Missing levels are reinjected in class or membership by predict()
predict(res, type = "both")
## ... but, of course, the classifier is wrong for Iris versicolor
confusion(predict(res, newdata = iris), iris$Species)

## Simpler interface, but more memory-effective
summary(mlLda(train = iris[, -5], response = iris$Species))


## Supervised classification using quadratic discriminant analysis
summary(res <- mlQda(Species ~ ., data = irisTrain))
confusion(res) # Self-consistency
confusion(predict(res, newdata = irisTest), irisTest$Species) # Performances

## Another dataset (binary predictor... not optimal for qda, just for test)
summary(res <- mlQda(Class ~ ., data = HouseVotes84, na.action = na.omit))
confusion(res) # Self-consistency


## Supervised classification using random forest
summary(res <- mlRforest(Species ~ ., data = irisTrain))
plot(res)
## For such a relatively simple case, 50 trees are enough
summary(res <- mlRforest(Species ~ ., data = irisTrain, ntree = 50))
predict(res) # Default type is class
predict(res, type = "membership")
predict(res, type = "both")
predict(res, type = "vote")
## Out-of-bag prediction
predict(res, method = "oob")
confusion(res) # Self-consistency
confusion(res, method = "oob") # Out-of-bag performances
## Cross-validation prediction is a good choice when there is no test set:
predict(res, method = "cv")  # Idem: cvpredict(res)
confusion(res, method = "cv") # Cross-validation for performances estimation
## Evaluation of performances using a separate test set
confusion(predict(res, newdata = irisTest), irisTest$Species) # Test set perfs

## Regression using random forest (from ?randomForest)
set.seed(131)
summary(ozone.rf <- mlRforest(Ozone ~ ., data = airquality, mtry = 3,
    importance = TRUE, na.action = na.omit))
## Show "importance" of variables: higher value mean more important:
round(randomForest::importance(ozone.rf), 2)
plot(na.omit(airquality)$Ozone, predict(ozone.rf))
abline(a = 0, b = 1)

## Unsupervised classification using random forest (from ?randomForest)
set.seed(17)
summary(iris.urf <- mlRforest(~ ., iris[, -5]))
randomForest::MDSplot(iris.urf, iris$Species)
plot(hclust(as.dist(1 - iris.urf$proximity), method = "average"),
    labels = iris$Species)


## Supervised classification using neural network
set.seed(689)
summary(res <- mlNnet(Species ~ ., data = irisTrain))
predict(res) # Default type is class
predict(res, type = "membership")
predict(res, type = "both")
confusion(res) # Self-consistency
confusion(predict(res, newdata = irisTest), irisTest$Species) # Test set perfs

## Idem, but two classes prediction using factor predictors
set.seed(325)
summary(res <- mlNnet(Class ~ ., data = HouseVotes84, na.action = na.omit))
confusion(res) # Self-consistency

## Regression using neural network
set.seed(34)
summary(ozone.nnet <- mlNnet(Ozone ~ ., data = airquality, na.action = na.omit,
    skip = TRUE, decay = 1e-3, size = 20, linout = TRUE))
plot(na.omit(airquality)$Ozone, predict(ozone.nnet))
abline(a = 0, b = 1)


## Supervised classification using learning vector quantization
summary(res <- mlLvq(Species ~ ., data = irisTrain))
predict(res) # This object only returns class
confusion(res) # Self-consistency
confusion(predict(res, newdata = irisTest), irisTest$Species) # Test set perfs


## Supervised classification using support vector machine
summary(res <- mlSvm(Species ~ ., data = irisTrain))
predict(res) # Default type is class
predict(res, type = "membership")
predict(res, type = "both")
confusion(res) # Self-consistency
confusion(predict(res, newdata = irisTest), irisTest$Species) # Test set perfs

## Another dataset
summary(res <- mlSvm(Class ~ ., data = HouseVotes84, na.action = na.omit))
confusion(res) # Self-consistency

## Regression using support vector machine
summary(ozone.svm <- mlSvm(Ozone ~ ., data = airquality, na.action = na.omit))
plot(na.omit(airquality)$Ozone, predict(ozone.svm))
abline(a = 0, b = 1)


## Supervised classification using naive Bayes
summary(res <- mlNaiveBayes(Species ~ ., data = irisTrain))
predict(res) # Default type is class
predict(res, type = "membership")
predict(res, type = "both")
confusion(res) # Self-consistency
confusion(predict(res, newdata = irisTest), irisTest$Species) # Test set perfs

## Another dataset
summary(res <- mlNaiveBayes(Class ~ ., data = HouseVotes84, na.action = na.omit))
confusion(res) # Self-consistency



