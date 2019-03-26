library(maxent)


### Name: save.model
### Title: saves a maximum entropy model to a file.
### Aliases: save.model
### Keywords: methods

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
save.model(model,"myModel")

# TRAIN USING REGULAR MATRIX REPRESENTATION
model <- maxent(as.matrix(matrix)[1:100,],as.factor(data$Topic.Code)[1:100])
save.model(model,"myModel")



