library(maxent)


### Name: maxent
### Title: trains a maximum entropy model given a training matrix and a
###   vector or factor of labels.
### Aliases: maxent
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

# A DIFFERENT EXAMPLE (taken from package e10711)
# CREATE DATA
x <- seq(0.1, 5, by = 0.05)
y <- log(x) + rnorm(x, sd = 0.2)

# ESTIMATE MODEL AND PREDICT INPUT VALUES
m <- maxent(x, y)
new <- predict(m, x)

# VISUALIZE
plot(x, y)
points(x, log(x), col = 2)
points(x, new[,1], col = 4)



