library(OSTSC)


### Name: OSTSC
### Title: Over Sampling for Time Series Classification
### Aliases: OSTSC

### ** Examples

# This is a simple example to show the usage of OSTSC. See the vignetter for a tutorial 
# demonstrating more complex examples.
# loading data
data(Dataset_Synthetic_Control)
# get split feature and label data 
train.label <- Dataset_Synthetic_Control$train.y
train.sample <- Dataset_Synthetic_Control$train.x
# the first dimension of the feature set and labels must be the same
# the second dimension of the feature set is the sequence length
dim(train.sample)
dim(train.label)
# check the imbalance ratio of the data
table(train.label)
# oversample class 1 to the same number of observations as class 0
MyData <- OSTSC(train.sample, train.label, parallel = FALSE)
# store the feature data after oversampling
x <- MyData$sample
# store the label data after oversampling
y <- MyData$label
# check the imbalance of the data
table(y)



