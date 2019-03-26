library(mlr)


### Name: makeFunctionalData
### Title: Create a data.frame containing functional features from a normal
###   data.frame.
### Aliases: makeFunctionalData

### ** Examples

# data.frame where columns 1:6 and 8:10 belong to a functional feature
d1 = data.frame(matrix(rnorm(100), nrow = 10), "target" = seq_len(10))
# Transform to functional data
d2 = makeFunctionalData(d1, fd.features = list("fd1" = 1:6, "fd2" = 8:10))
# Create a regression task
makeRegrTask(data = d2, target = "target")



