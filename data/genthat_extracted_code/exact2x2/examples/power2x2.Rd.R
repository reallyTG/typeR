library(exact2x2)


### Name: power2x2
### Title: Calculate exact power or sample size for conditional tests for
###   two independent binomials.
### Aliases: power2x2 ss2x2
### Keywords: htest

### ** Examples

power2x2(.2,.8,12,15)
# calculate sample size with 2:1 allocation to groups
ss2x2(.2,.8,n1.over.n0=2,power=.8,approx=TRUE)
ss2x2(.2,.8,n1.over.n0=2,power=.8,print.steps=TRUE)



