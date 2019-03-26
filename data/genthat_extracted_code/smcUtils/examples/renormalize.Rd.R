library(smcUtils)


### Name: renormalize
### Title: Renormalize weights
### Aliases: renormalize
### Keywords: htest

### ** Examples

ws = runif(10)
renormalize(ws)

log.ws = dnorm(rnorm(10,1,0),log=TRUE)
renormalize(log.ws,log=TRUE)



