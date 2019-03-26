library(diffpriv)


### Name: sensitivitySamplerManual,DPMechNumeric,function,numeric,numeric,numeric-method
### Title: Sensitivity sampler for 'DPMechNumeric-class'.
### Aliases:
###   sensitivitySamplerManual,DPMechNumeric,function,numeric,numeric,numeric-method

### ** Examples

## Simple example with unbounded data hence no global sensitivity.
f <- function(xs) mean(xs)
m <- DPMechLaplace(target = f, dims = 1)
P <- function(n) rnorm(n)
m <- sensitivitySamplerManual(m, oracle = P, n = 100, m = 10, k = 10)
m@sensitivity




