library(FADA)


### Name: decorrelate.train
### Title: Factor Adjusted Discriminant Analysis 1: Decorrelation of the
###   training data
### Aliases: decorrelate.train

### ** Examples

data(data.train)

res0 = decorrelate.train(data.train,nbf=3) #  when the number of factors is forced

res1 = decorrelate.train(data.train) #  when the optimal number of factors is unknown



