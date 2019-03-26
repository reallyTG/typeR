library(spate)


### Name: trace.plot
### Title: Trace plots for MCMC output analysis.
### Aliases: trace.plot

### ** Examples

data <- matrix(rnorm(1200),nrow=6)
par(mfrow=c(2,3))
trace.plot(data,true=rep(0,6))



