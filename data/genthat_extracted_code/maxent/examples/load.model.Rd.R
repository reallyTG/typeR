library(maxent)


### Name: load.model
### Title: loads a maximum entropy model from a file.
### Aliases: load.model
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
saved_model <- load.model("myModel")
results <- predict(saved_model,sparse[101:150,])



