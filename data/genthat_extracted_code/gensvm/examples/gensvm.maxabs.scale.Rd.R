library(gensvm)


### Name: gensvm.maxabs.scale
### Title: Scale each column of a matrix by its maximum absolute value
### Aliases: gensvm.maxabs.scale

### ** Examples

x <- iris[, -5]

# check the min and max of the columns
apply(x, 2, min)
apply(x, 2, max)

# scale the data
x.scale <- gensvm.maxabs.scale(x)

# check again (max should be 1.0, min shouldn't be below -1)
apply(x.scale, 2, min)
apply(x.scale, 2, max)

# with a train and test dataset
split <- gensvm.train.test.split(x)
x.train <- split$x.train
x.test <- split$x.test
scaled <- gensvm.maxabs.scale(x.train, x.test)
x.train.scl <- scaled$x
x.test.scl <- scaled$x.test




