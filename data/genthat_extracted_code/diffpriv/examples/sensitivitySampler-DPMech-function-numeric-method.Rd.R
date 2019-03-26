library(diffpriv)


### Name: sensitivitySampler,DPMech,function,numeric-method
### Title: Sensitivity sampler for 'DPMech-class"s.
### Aliases: sensitivitySampler,DPMech,function,numeric-method

### ** Examples

## Simple example with unbounded data hence no global sensitivity.
f <- function(xs) mean(xs)
m <- DPMechLaplace(target = f, dims = 1)
m@sensitivity ## Inf
m@gammaSensitivity ## NA as Laplace is naturally eps-DP
P <- function(n) rnorm(n)
m <- sensitivitySampler(m, oracle = P, n = 100, gamma = 0.33)
m@sensitivity ## small like 0.03...
m@gammaSensitivity ## 0.33 as directed, now m is (eps,gam)-DP.




