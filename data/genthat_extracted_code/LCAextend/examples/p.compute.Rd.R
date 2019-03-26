library(LCAextend)


### Name: p.compute
### Title: computes the probability vector using logistic coefficients
### Aliases: p.compute

### ** Examples

# a vector of probability
p <- c(0,0.2,0,0,0.3,0.4,0.1,0,0)
alpha <- alpha.compute(p)
#gives alpha= -Inf -1.38 0 0 1.38 0 2.19 Inf Inf
p.compute(alpha) #gives p



