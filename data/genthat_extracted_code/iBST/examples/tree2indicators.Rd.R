library(iBST)


### Name: tree2indicators
### Title: From a tree to indicators (or dummy variables)
### Aliases: tree2indicators
### Keywords: documentation tree

### ** Examples

fit <- rpart(Kyphosis ~ Age + Number + Start, data = kyphosis)
tree2indicators(fit)



