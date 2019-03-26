library(lmfor)


### Name: updown
### Title: Solve a simple equation using a step halving algorithm.
### Aliases: updown
### Keywords: numerical computations

### ** Examples

## Compute the median of Weibull distibution
fn<-function(x) pweibull(x,5,15)-0.5
updown(1,50,fn)



