library(caret)


### Name: plsda
### Title: Partial Least Squares and Sparse Partial Least Squares
###   Discriminant Analysis
### Aliases: plsda plsda.default predict.plsda splsda.default
###   predict.splsda splsda
### Keywords: models

### ** Examples


## Not run: 
##D data(mdrr)
##D set.seed(1)
##D inTrain <- sample(seq(along = mdrrClass), 450)
##D 
##D nzv <- nearZeroVar(mdrrDescr)
##D filteredDescr <- mdrrDescr[, -nzv]
##D 
##D training <- filteredDescr[inTrain,]
##D test <- filteredDescr[-inTrain,]
##D trainMDRR <- mdrrClass[inTrain]
##D testMDRR <- mdrrClass[-inTrain]
##D 
##D preProcValues <- preProcess(training)
##D 
##D trainDescr <- predict(preProcValues, training)
##D testDescr <- predict(preProcValues, test)
##D 
##D useBayes   <- plsda(trainDescr, trainMDRR, ncomp = 5,
##D                     probMethod = "Bayes")
##D useSoftmax <- plsda(trainDescr, trainMDRR, ncomp = 5)
##D 
##D confusionMatrix(predict(useBayes, testDescr),
##D                 testMDRR)
##D 
##D confusionMatrix(predict(useSoftmax, testDescr),
##D                 testMDRR)
##D 
##D histogram(~predict(useBayes, testDescr, type = "prob")[,"Active",]
##D           | testMDRR, xlab = "Active Prob", xlim = c(-.1,1.1))
##D histogram(~predict(useSoftmax, testDescr, type = "prob")[,"Active",]
##D           | testMDRR, xlab = "Active Prob", xlim = c(-.1,1.1))
##D 
##D 
##D ## different sized objects are returned
##D length(predict(useBayes, testDescr))
##D dim(predict(useBayes, testDescr, ncomp = 1:3))
##D dim(predict(useBayes, testDescr, type = "prob"))
##D dim(predict(useBayes, testDescr, type = "prob", ncomp = 1:3))
##D 
##D ## Using spls:
##D ## (As of 11/09, the spls package now has a similar function with
##D ## the same mane. To avoid conflicts, use caret:::splsda to
##D ## get this version)
##D 
##D splsFit <- caret:::splsda(trainDescr, trainMDRR,
##D                           K = 5, eta = .9,
##D                           probMethod = "Bayes")
##D 
##D confusionMatrix(caret:::predict.splsda(splsFit, testDescr),
##D                 testMDRR)
## End(Not run)




