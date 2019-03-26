library(RRF)


### Name: plot.RRF
### Title: Plot method for RRF objects
### Aliases: plot.RRF
### Keywords: classif regression tree

### ** Examples

data(mtcars)
plot(RRF(mpg ~ ., mtcars, keep.forest=FALSE, ntree=100), log="y")



