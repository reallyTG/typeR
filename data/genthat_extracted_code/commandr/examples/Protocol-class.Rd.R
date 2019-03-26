library(commandr)


### Name: Protocol-class
### Title: Protocol: Concrete Step in a Pipeline
### Aliases: class:Protocol Protocol-class Protocol parameters
###   parameters,Protocol-method stage stage,Protocol-method
###   method,Protocol-method pipeline,Protocol-method method perform
###   callNextProtocol protocolClass

### ** Examples

setStage("average", intype = "numeric")
setProtocol("mean", fun = mean, parent = "average")
setProtocol("quantile", representation = list(probs = "numeric"),
            fun = quantile, parent = "average")

proto_avg_mean <- Protocol("average")
proto_avg_mean <- Protocol("average", "mean")
proto_avg_quantile <- Protocol("average", "quantile")
proto_avg_quantile_075 <- Protocol("average", "quantile", probs = 0.75)

proto <- proto_avg_quantile_075
proto
stage(proto)
inType(proto)
parameters(proto)



