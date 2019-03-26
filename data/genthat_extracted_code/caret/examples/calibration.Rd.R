library(caret)


### Name: calibration
### Title: Probability Calibration Plot
### Aliases: calibration calibration.formula calibration.default
###   xyplot.calibration ggplot.calibration panel.calibration
###   print.calibration
### Keywords: hplot

### ** Examples

## Not run: 
##D data(mdrr)
##D mdrrDescr <- mdrrDescr[, -nearZeroVar(mdrrDescr)]
##D mdrrDescr <- mdrrDescr[, -findCorrelation(cor(mdrrDescr), .5)]
##D 
##D 
##D inTrain <- createDataPartition(mdrrClass)
##D trainX <- mdrrDescr[inTrain[[1]], ]
##D trainY <- mdrrClass[inTrain[[1]]]
##D testX <- mdrrDescr[-inTrain[[1]], ]
##D testY <- mdrrClass[-inTrain[[1]]]
##D 
##D library(MASS)
##D 
##D ldaFit <- lda(trainX, trainY)
##D qdaFit <- qda(trainX, trainY)
##D 
##D testProbs <- data.frame(obs = testY,
##D                         lda = predict(ldaFit, testX)$posterior[,1],
##D                         qda = predict(qdaFit, testX)$posterior[,1])
##D 
##D calibration(obs ~ lda + qda, data = testProbs)
##D 
##D calPlotData <- calibration(obs ~ lda + qda, data = testProbs)
##D calPlotData
##D 
##D xyplot(calPlotData, auto.key = list(columns = 2))
## End(Not run)




