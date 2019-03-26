library(caret)


### Name: rfe
### Title: Backwards Feature Selection
### Aliases: rfe rfe.default rfeIter predict.rfe update.rfe
### Keywords: models

### ** Examples


## Not run: 
##D data(BloodBrain)
##D 
##D x <- scale(bbbDescr[,-nearZeroVar(bbbDescr)])
##D x <- x[, -findCorrelation(cor(x), .8)]
##D x <- as.data.frame(x)
##D 
##D set.seed(1)
##D lmProfile <- rfe(x, logBBB,
##D                  sizes = c(2:25, 30, 35, 40, 45, 50, 55, 60, 65),
##D                  rfeControl = rfeControl(functions = lmFuncs,
##D                                          number = 200))
##D set.seed(1)
##D lmProfile2 <- rfe(x, logBBB,
##D                  sizes = c(2:25, 30, 35, 40, 45, 50, 55, 60, 65),
##D                  rfeControl = rfeControl(functions = lmFuncs,
##D                                          rerank = TRUE,
##D                                          number = 200))
##D 
##D xyplot(lmProfile$results$RMSE + lmProfile2$results$RMSE  ~
##D        lmProfile$results$Variables,
##D        type = c("g", "p", "l"),
##D        auto.key = TRUE)
##D 
##D rfProfile <- rfe(x, logBBB,
##D                  sizes = c(2, 5, 10, 20),
##D                  rfeControl = rfeControl(functions = rfFuncs))
##D 
##D bagProfile <- rfe(x, logBBB,
##D                   sizes = c(2, 5, 10, 20),
##D                   rfeControl = rfeControl(functions = treebagFuncs))
##D 
##D set.seed(1)
##D svmProfile <- rfe(x, logBBB,
##D                   sizes = c(2, 5, 10, 20),
##D                   rfeControl = rfeControl(functions = caretFuncs,
##D                                           number = 200),
##D                   ## pass options to train()
##D                   method = "svmRadial")
##D 
##D ## classification
##D 
##D data(mdrr)
##D mdrrDescr <- mdrrDescr[,-nearZeroVar(mdrrDescr)]
##D mdrrDescr <- mdrrDescr[, -findCorrelation(cor(mdrrDescr), .8)]
##D 
##D set.seed(1)
##D inTrain <- createDataPartition(mdrrClass, p = .75, list = FALSE)[,1]
##D 
##D train <- mdrrDescr[ inTrain, ]
##D test  <- mdrrDescr[-inTrain, ]
##D trainClass <- mdrrClass[ inTrain]
##D testClass  <- mdrrClass[-inTrain]
##D 
##D set.seed(2)
##D ldaProfile <- rfe(train, trainClass,
##D                   sizes = c(1:10, 15, 30),
##D                   rfeControl = rfeControl(functions = ldaFuncs, method = "cv"))
##D plot(ldaProfile, type = c("o", "g"))
##D 
##D postResample(predict(ldaProfile, test), testClass)
##D 
## End(Not run)

#######################################
## Parallel Processing Example via multicore

## Not run: 
##D library(doMC)
##D 
##D ## Note: if the underlying model also uses foreach, the
##D ## number of cores specified above will double (along with
##D ## the memory requirements)
##D registerDoMC(cores = 2)
##D 
##D set.seed(1)
##D lmProfile <- rfe(x, logBBB,
##D                  sizes = c(2:25, 30, 35, 40, 45, 50, 55, 60, 65),
##D                  rfeControl = rfeControl(functions = lmFuncs,
##D                                          number = 200))
##D 
##D 
## End(Not run)





