library(kamila)


### Name: classifyKamila
### Title: Classify new data into existing KAMILA clusters
### Aliases: classifyKamila

### ** Examples

# Generate toy data set
set.seed(1234)
dat1 <- genMixedData(400, nConVar = 2, nCatVar = 2, nCatLevels = 4,
  nConWithErr = 2, nCatWithErr = 2, popProportions = c(.5,.5),
  conErrLev = 0.2, catErrLev = 0.2)
# Partition the data into training/test set
trainingIds <- sample(nrow(dat1$conVars), size = 300, replace = FALSE)
catTrain <- data.frame(apply(dat1$catVars[trainingIds,], 2, factor))
conTrain <- data.frame(scale(dat1$conVars)[trainingIds,])
catTest <- data.frame(apply(dat1$catVars[-trainingIds,], 2, factor))
conTest <- data.frame(scale(dat1$conVars)[-trainingIds,])
# Run the kamila clustering procedure on the training set
kamilaObj <- kamila(conTrain, catTrain, numClust = 2, numInit = 10)
table(dat1$trueID[trainingIds], kamilaObj$finalMemb)
# Predict membership in the test data set
kamilaPred <- classifyKamila(kamilaObj, list(conTest, catTest))
table(dat1$trueID[-trainingIds], kamilaPred)



