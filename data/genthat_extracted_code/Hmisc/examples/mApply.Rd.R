library(Hmisc)


### Name: mApply
### Title: Apply a Function to Rows of a Matrix or Vector
### Aliases: mApply
### Keywords: iteration category

### ** Examples

require(datasets, TRUE)
a <- mApply(iris[,-5], iris$Species, mean)



