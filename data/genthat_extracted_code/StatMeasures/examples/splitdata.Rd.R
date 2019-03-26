library(StatMeasures)


### Name: splitdata
### Title: Split modeling data into test and train set
### Aliases: splitdata

### ** Examples

# A 'data.frame'
df <- data.frame(x = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
                 y = c('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'),
                 z = c(1, 1, 0, 0, 1, 0, 0, 1, 1, 0))

# Split data into train (70%) and test (30%)
ltData <- splitdata(data = df, fraction = 0.7, seed = 123)
trainData <- ltData$train
testData <- ltData$test



