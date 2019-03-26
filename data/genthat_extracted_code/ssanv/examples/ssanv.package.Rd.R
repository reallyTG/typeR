library(ssanv)


### Name: ssanv-package
### Title: Sample Size Adjusted for Nonadherence or Variability of Input
###   Parameters
### Aliases: ssanv-package ssanv
### Keywords: htest

### ** Examples

### Suppose treatment will not work on about 30 percent of subjects 
### then rho0=.3 and clinically significant difference in means is .5 
ss.nonadh(delta=.5,rho0=.3)

### Suppose you estimate standard deviation of .32 from a sample of size 12
### and the clinically significant difference is .2
ss.fromdata.nvar(delta=.2,sdhat=.32,df=11)
### The usual method is to assume that the standard deviation is known 
### this result is the same as df=Inf
ss.fromdata.nvar(delta=.2,sdhat=.32,df=Inf)



