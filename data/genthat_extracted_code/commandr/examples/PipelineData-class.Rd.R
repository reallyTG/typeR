library(commandr)


### Name: PipelineData-class
### Title: PipelineData: Data with history
### Aliases: class:PipelineData PipelineData-class explore
###   explore,ANY,missing-method pipeline,ANY-method

### ** Examples

## A non-PipelineData data example
setStage("average", intype = "numeric")
setProtocol("mean", fun = mean, parent = "average")
setProtocol("quantile", representation = list(probs = "numeric"),
            fun = quantile, parent = "average")
setProtocol("range", representation = list(low = "numeric", high = "numeric"), 
            fun = function(x, low = 0, high = Inf) x[x >= low & x <= high],
            parent = setStage("trim", intype = "numeric"))

d <- c(1, 2, 4)
p <- Pipeline("trim", "average")
d2 <- perform(p, d)
attr(d2, 'pipeline')
pipeline(d2)
## Not run: 
##D ## this will give an error, no slot called pipelinem, just numeric value.
##D d2@pipeline
## End(Not run)

setClass("ProcessNumeric", contains = c("numeric", "PipelineData"))
d <- new("ProcessNumeric", c(1, 2, 4))
d@pipeline
setStage("average", intype = "ProcessNumeric")
setProtocol("mean", fun = function(x) new("ProcessNumeric", mean(x)), parent = "average")
setProtocol("quantile", representation = list(probs = "numeric"),
            fun = function(x) new("ProcessNumeric", quantile(x)), parent = "average")
setProtocol("range", representation = list(low = "numeric", high = "numeric"), 
            fun = function(x, low = 0, high = Inf) new("ProcessNumeric",
                                          x[x >= low & x <= high]),
            parent = setStage("trim", intype = "ProcessNumeric"))

p <- Pipeline("trim", "average")
d2 <- perform(p, d)
attr(d2, 'pipeline')
pipeline(d2)
class(d2)
d2@pipeline



