library(gensvm)


### Name: gensvm.train.test.split
### Title: Create a train/test split of a dataset
### Aliases: gensvm.train.test.split

### ** Examples

x <- iris[, -5]
y <- iris[, 5]

# using the default values
split <- gensvm.train.test.split(x, y)

# using the split in a GenSVM model
fit <- gensvm(split$x.train, split$y.train)
gensvm.accuracy(split$y.test, predict(fit, split$x.test))

# using attach makes the results directly available
attach(gensvm.train.test.split(x, y))
fit <- gensvm(x.train, y.train)
gensvm.accuracy(y.test, predict(fit, x.test))




