library(mlr)


### Name: makeResampleInstance
### Title: Instantiates a resampling strategy object.
### Aliases: makeResampleInstance ResampleInstance

### ** Examples

rdesc = makeResampleDesc("Bootstrap", iters = 10)
rin = makeResampleInstance(rdesc, task = iris.task)

rdesc = makeResampleDesc("CV", iters = 50)
rin = makeResampleInstance(rdesc, size = nrow(iris))

rin = makeResampleInstance("CV", iters = 10, task = iris.task)



