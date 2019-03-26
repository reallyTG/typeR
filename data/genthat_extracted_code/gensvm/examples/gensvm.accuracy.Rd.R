library(gensvm)


### Name: gensvm.accuracy
### Title: Compute the accuracy score
### Aliases: gensvm.accuracy

### ** Examples

x <- iris[, -5]
y <- iris[, 5]

fit <- gensvm(x, y)
gensvm.accuracy(predict(fit, x), y)




