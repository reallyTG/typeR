library(TSdist)


### Name: OneNN
### Title: 1NN classification for a pair of train/test time series
###   datasets.
### Aliases: OneNN

### ** Examples


# The example.database2 synthetic database is loaded
data(example.database2)

# Create train/test by dividing the dataset 70%-30%
set.seed(100)
trainindex <- sample(1:100, 70, replace=FALSE)
train <- example.database2[[1]][trainindex, ]
test <- example.database2[[1]][-trainindex, ]
trainclass <- example.database2[[2]][trainindex]
testclass <- example.database2[[2]][-trainindex]

# Apply the 1NN classifier for different distance measures

OneNN(train, trainclass, test, testclass, "euclidean")
OneNN(train, trainclass, test, testclass, "pdc")





