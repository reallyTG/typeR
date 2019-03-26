library(conformalClassification)


### Name: parTCPClassification
### Title: Class-conditional transductive conformal classifier for
###   multi-class problems, paralled computations
### Aliases: parTCPClassification

### ** Examples

## load the library
#library(mlbench)
#library(caret)
#library(conformalClassification)

## load the DNA dataset
#data(DNA)
#originalData <- DNA

## make sure first column is always the label and class labels are always 1, 2, ...
#nrAttr = ncol(originalData) #no of attributes
#tempColumn = originalData[, 1]
#originalData[, 1] = originalData[, nrAttr]
#originalData[, nrAttr] = tempColumn
#originalData[, 1] = as.factor(originalData[, 1])
#originalData[, 1] = as.numeric(originalData[, 1])

## partition the data into training and test set
#result = createDataPartition(originalData[, 1], p = 0.8, list = FALSE)
#trainingSet = originalData[result, ]
#testSet = originalData[-result, ]

##ICP classification
#pValues = parTCPClassification(trainingSet, testSet)
#perfVlaues = pValues2PerfMetrics(pValues, testSet)
#print(perfVlaues)
#CPCalibrationPlot(pValues, testSet, "blue")
#not run



