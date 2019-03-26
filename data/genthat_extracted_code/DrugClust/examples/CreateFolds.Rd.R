library(DrugClust)


### Name: CreateFolds
### Title: CreateFolds
### Aliases: CreateFolds

### ** Examples

r <- 8
c <- 10
m0 <- matrix(0, r, c)
features<-apply(m0, c(1,2), function(x) sample(c(0,1),1))
folds<-CreateFolds(features,4)



