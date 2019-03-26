library(MAVE)


### Name: spam
### Title: 4601 email record
### Aliases: spam
### Keywords: datasets

### ** Examples

data(spam)
train = sample(1:4601)[1:1000]
x.train <- as.matrix(spam[train,1:57])
y.train <- as.matrix(spam[train,58])
x.test <- as.matrix(spam[-train,1:57])
y.test <- as.matrix(spam[-train,58])
x.train <- sqrt(x.train)
x.test <- sqrt(x.test)



