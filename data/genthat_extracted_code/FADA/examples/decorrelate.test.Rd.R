library(FADA)


### Name: decorrelate.test
### Title: Factor Adjusted Discriminant Analysis 2: Decorrelation of a
###   testing data set after running the 'decorrelate.train' function on a
###   training data set
### Aliases: decorrelate.test

### ** Examples

data(data.train)
data(data.test)
fa = decorrelate.train(data.train)
fa2 = decorrelate.test(fa,data.test)
names(fa2)



