library(itree)


### Name: path.itree
### Title: Follow Paths to Selected Nodes of an itree Object
### Aliases: path.itree
### Keywords: tree

### ** Examples

#rpart example:
fit <- itree(Kyphosis ~ Age + Number + Start, data=kyphosis)
summary(fit)
path.itree(fit, node=c(11, 22))



