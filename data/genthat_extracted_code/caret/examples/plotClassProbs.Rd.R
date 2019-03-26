library(caret)


### Name: plotClassProbs
### Title: Plot Predicted Probabilities in Classification Models
### Aliases: plotClassProbs
### Keywords: hplot

### ** Examples


## Not run: 
##D data(mdrr)
##D set.seed(90)
##D inTrain <- createDataPartition(mdrrClass, p = .5)[[1]]
##D 
##D trainData <- mdrrDescr[inTrain,1:20]
##D testData <- mdrrDescr[-inTrain,1:20]
##D 
##D trainY <- mdrrClass[inTrain]
##D testY <- mdrrClass[-inTrain]
##D 
##D ctrl <- trainControl(method = "cv")
##D 
##D nbFit1 <- train(trainData, trainY, "nb",
##D                 trControl = ctrl,
##D                 tuneGrid = data.frame(usekernel = TRUE, fL = 0))
##D 
##D nbFit2 <- train(trainData, trainY, "nb",
##D                 trControl = ctrl,
##D                 tuneGrid = data.frame(usekernel = FALSE, fL = 0))
##D 
##D 
##D models <- list(para = nbFit2, nonpara = nbFit1)
##D 
##D predProbs <- extractProb(models, testX = testData,  testY = testY)
##D 
##D plotClassProbs(predProbs, useObjects = TRUE)
##D plotClassProbs(predProbs,
##D                subset = object == "para" & dataType == "Test")
##D plotClassProbs(predProbs,
##D                useObjects = TRUE,
##D                plotType = "densityplot",
##D                auto.key = list(columns = 2))
## End(Not run)






