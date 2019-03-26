library(nbc4va)


### Name: nbc4vaIO
### Title: Run nbc4va using file input and output
### Aliases: nbc4vaIO

### ** Examples

library(nbc4va)
data(nbc4vaData)

# Split data into train and test sets
train <- nbc4vaData[1:50, ]
test <- nbc4vaData[51:100, ]

# Save train and test data as csv in temp location
trainFile <- tempfile(fileext=".csv")
testFile <- tempfile(fileext=".csv")
write.csv(train, trainFile, row.names=FALSE)
write.csv(test, testFile, row.names=FALSE)

# Use nbc4vaIO via file input and output
# Set "known" to indicate whether test causes are known
outFiles <- nbc4vaIO(trainFile, testFile, known=TRUE)

# Use nbc4vaIO as a wrapper
out <- nbc4vaIO(train, test, known=TRUE, saveFiles=FALSE)




