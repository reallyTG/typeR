library(caret)


### Name: Sacramento
### Title: Sacramento CA Home Prices
### Aliases: Sacramento
### Keywords: datasets

### ** Examples


data(Sacramento)

set.seed(955)
in_train <- createDataPartition(log10(Sacramento$price), p = .8, list = FALSE)

training <- Sacramento[ in_train,]
testing  <- Sacramento[-in_train,]





