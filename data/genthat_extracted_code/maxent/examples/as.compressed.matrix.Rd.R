library(maxent)


### Name: as.compressed.matrix
### Title: converts a tm DocumentTermMatrix or TermDocumentMatrix into a
###   matrix.csr representation.
### Aliases: as.compressed.matrix
### Keywords: methods

### ** Examples

# LOAD LIBRARY
library(maxent)

# READ THE DATA, PREPARE THE CORPUS, and CREATE THE MATRIX
data <- read.csv(system.file("data/NYTimes.csv.gz",package="maxent"))
corpus <- Corpus(VectorSource(data$Title[1:150]))
matrix <- DocumentTermMatrix(corpus)

# CREATE A MATRIX.CSR (SPARSEM) REPRESENTATION
sparse <- as.compressed.matrix(matrix)



