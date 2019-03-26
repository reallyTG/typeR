library(fastAdaboost)


### Name: get_tree
### Title: Fetches a decision tree
### Aliases: get_tree

### ** Examples

fakedata <- data.frame( X=c(rnorm(100,0,1),rnorm(100,1,1)), Y=c(rep(0,100),rep(1,100) ) )
fakedata$Y <- factor(fakedata$Y)
test_adaboost <- adaboost(Y~X, fakedata, 10)
tree <- get_tree(test_adaboost,5)



