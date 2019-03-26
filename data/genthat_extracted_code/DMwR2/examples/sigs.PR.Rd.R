library(DMwR2)


### Name: sigs.PR
### Title: Precision and recall of a set of predicted trading signals
### Aliases: sigs.PR
### Keywords: models

### ** Examples

## A simple illustrative example use with random signals
ind <- rnorm(sd=0.3,100)
sigs <- trading.signals(ind,b.t=0.1,s.t=-0.1)
indT <- rnorm(sd=0.3,100)
sigsT <- trading.signals(indT,b.t=0.1,s.t=-0.1)
sigs.PR(sigs,sigsT)



