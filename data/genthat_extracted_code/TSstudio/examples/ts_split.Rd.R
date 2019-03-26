library(TSstudio)


### Name: ts_split
### Title: Split Time Series Object for Training and Testing Partitions
### Aliases: ts_split

### ** Examples


## Split the USgas dataset into training and testing partitions

## Set the last 12 months as a testing partition 

## and the rest as a training partition

data(USgas, package = "TSstudio")

split_USgas <- ts_split(ts.obj = USgas, sample.out = 12)

training <- split_USgas$train
testing <- split_USgas$test

length(USgas)

length(training)
length(testing)



