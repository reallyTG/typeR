library(llama)


### Name: trainTest
### Title: Train / test split
### Aliases: trainTest
### Keywords: models

### ** Examples

data(satsolvers)
trainTest = trainTest(satsolvers)

# use 50-50 split instead of 60-40
trainTest1 = trainTest(satsolvers, 0.5)

# stratify
trainTestU = trainTest(satsolvers, stratify=TRUE)



