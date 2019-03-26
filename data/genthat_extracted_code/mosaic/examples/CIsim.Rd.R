library(mosaic)


### Name: CIsim
### Title: Compute confidence intervals from (multiple) simulated data sets
### Aliases: CIsim
### Keywords: inference simulation

### ** Examples

# 1000 95% intervals using t.test; population is N(0,1)
CIsim(n=10, samples=1000)    
# this time population is Exp(1); fewer samples, so we get a plot 
CIsim(n=10, samples=100, rdist=rexp, estimand=1) 
# Binomial treats 1 like success, 0 like failure
CIsim(n=30, samples=100, rdist=rbinom, args=list(size=1, prob=.7), 
       estimand = .7, method = binom.test, method.args=list(ci = "Plus4"))  




