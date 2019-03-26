library(rpart)


### Name: path.rpart
### Title: Follow Paths to Selected Nodes of an Rpart Object
### Aliases: path.rpart
### Keywords: tree

### ** Examples

fit <- rpart(Kyphosis ~ Age + Number + Start, data = kyphosis)
print(fit)
path.rpart(fit, node = c(11, 22))



