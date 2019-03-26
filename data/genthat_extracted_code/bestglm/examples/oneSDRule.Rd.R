library(bestglm)


### Name: oneSDRule
### Title: Utility function. Implements the 1-sd rule.
### Aliases: oneSDRule

### ** Examples

CV<-c(1.4637799,0.7036285,0.6242480,0.6069406,0.6006877,0.6005472,0.5707958,
      0.5907897,0.5895489)
CVsd<-c(0.24878992,0.14160499,0.08714908,0.11376041,0.08522291,
 0.11897327,0.07960879,0.09235052,0.12860983)
CVout <- matrix(c(CV,CVsd), ncol=2)
oneSDRule(CVout)



