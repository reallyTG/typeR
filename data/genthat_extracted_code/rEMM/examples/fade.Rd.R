library(rEMM)


### Name: fade
### Title: Fading Cluster Structure and EMM Layer
### Aliases: fade fade,EMM,numeric,numeric-method
###   fade,EMM,missing,numeric-method fade,EMM,missing,missing-method
###   fade,EMM,numeric,missing-method
### Keywords: manip

### ** Examples

data("EMMTraffic")

## For the example we use a very high learning rate
## this calls fade after each new data point
emm_l <- EMM(measure="eJaccard", threshold=0.2, lambda = 1)
build(emm_l, EMMTraffic)

## build a regular EMM for comparison
emm <- EMM(measure="eJaccard", threshold=0.2)
build(emm, EMMTraffic)

## compare the transition matrix
transition_matrix(emm)
transition_matrix(emm_l)

## compare graphs
op <- par(mfrow = c(1, 2), pty = "m")
plot(emm, main = "regular EMM")
plot(emm_l, main = "EMM with high learning rate")
par(op)




