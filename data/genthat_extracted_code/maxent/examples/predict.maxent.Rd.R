library(maxent)


### Name: predict.maxent
### Title: predicts the expected label of a document given a trained model.
### Aliases: predict.maxent
### Keywords: methods

### ** Examples

# LOAD LIBRARY
library(maxent)

# READ THE DATA, PREPARE THE CORPUS, and CREATE THE MATRIX
data <- read.csv(system.file("data/NYTimes.csv.gz",package="maxent"))
corpus <- Corpus(VectorSource(data$Title[1:150]))
matrix <- DocumentTermMatrix(corpus)

# TRAIN/PREDICT USING SPARSEM REPRESENTATION
sparse <- as.compressed.matrix(matrix)
model <- maxent(sparse[1:100,],as.factor(data$Topic.Code)[1:100])
results <- predict(model,sparse[101:150,])



