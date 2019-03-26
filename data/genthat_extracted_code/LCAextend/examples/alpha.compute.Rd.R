library(LCAextend)


### Name: alpha.compute
### Title: computes cumulative logistic coefficients using probabilities
### Aliases: alpha.compute

### ** Examples

# a vector of probability
p <- c(0,0.2,0,0,0.3,0.4,0.1,0,0)
alpha.compute(p)
#gives -Inf -1.38 0 0 1.38 0 2.19 Inf Inf
p.compute(alpha.compute(rep(1/5,5)))



