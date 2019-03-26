library(MBESS)


### Name: ci.cc
### Title: Confidence interval for the population correlation coefficient
### Aliases: ci.cc
### Keywords: Design

### ** Examples

# Example, from Hayes. Suppose n=100 and r=.35. 
ci.cc(r=.35, n=100, conf.level=.95)

# Here is another way to enter the above example. 
ci.cc(r=.35, n=100, conf.level=NULL, alpha.lower=.025, alpha.upper=.025)

# Here are examples of one-sided confidence intervals. 
ci.cc(r=.35, n=100, conf.level=NULL, alpha.lower=0, alpha.upper=.05)
ci.cc(r=.35, n=100, conf.level=NULL, alpha.lower=.05, alpha.upper=0)



