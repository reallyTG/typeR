library(commandr)


### Name: setStage
### Title: Define a Stage Class
### Aliases: setStage

### ** Examples

## simplest definition
setStage("average")
## add a display name and specialize to numeric input
setStage("average", "Average Vector", intype = "numeric")
setProtocol("mean", fun = mean, parent = "average")
setProtocol("quantile", representation = list(probs = "numeric"),
            fun = quantile, parent = "average")
setProtocol("range", representation = list(low = "numeric", high = "numeric"), 
            fun = function(x, low = 0, high = Inf) x[x >= low & x <= high],
            parent = setStage("trim", intype = "numeric"))

## Class Stage derivative
showClass("StageAverage")
## Class Protocol derivative
showClass("ProtoAverage")

## generic defined
showMethods("average")

# try this generic method
d <- c(1, 2, 4)
average(d, "mean")

## create a pipeline
p <- Pipeline("trim", "average")
res <- perform(p, d)
res
## generic *Proto
averageProto(p)
averageProto(res)



