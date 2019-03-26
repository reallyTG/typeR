library(maxent)


### Name: maxent-class
### Title: an S4 class containing the trained maximum entropy model.
### Aliases: maxent-class
### Keywords: classes

### ** Examples

# LOAD LIBRARY
library(maxent)

# READ THE DATA, PREPARE THE CORPUS, and CREATE THE MATRIX
data <- read.csv(system.file("data/NYTimes.csv.gz",package="maxent"))
corpus <- Corpus(VectorSource(data$Title[1:150]))
matrix <- DocumentTermMatrix(corpus)

# TRAIN USING SPARSEM REPRESENTATION
sparse <- as.compressed.matrix(matrix)
model <- maxent(sparse[1:100,],as.factor(data$Topic.Code)[1:100])
class(model)
model@model
model@weights



