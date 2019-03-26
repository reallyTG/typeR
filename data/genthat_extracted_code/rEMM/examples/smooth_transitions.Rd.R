library(rEMM)


### Name: smooth_transitions
### Title: Smooths transition counts between neighboring states/clusters
### Aliases: smooth_transitions smooth_transitions,EMM-method
### Keywords: manip

### ** Examples

data("EMMTraffic")

## learn a model
emm <- EMM(threshold=0.2, measure="eJaccard")
build(emm, EMMTraffic)

## smooth the model by adding tansitions
emm_s <- smooth_transitions(emm)

## compare graphs
op <- par(mfrow = c(1, 2), pty = "m")
plot(emm, method="MDS", main="Original")
plot(emm_s, method="MDS", main="Smoothed")
par(op)



