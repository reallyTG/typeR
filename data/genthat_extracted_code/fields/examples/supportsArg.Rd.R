library(fields)


### Name: supportsArg
### Title: Tests if function supports a given argument
### Aliases: supportsArg

### ** Examples

################
#Test covariance function to see if it supports evaluation of 
#covariance matrix over upper triangle only
################

supportsArg(Rad.cov, "distMat")
supportsArg(Rad.cov, "onlyUpper")
supportsArg(stationary.cov, "distMat")
supportsArg(stationary.cov, "onlyUpper")
supportsArg(Exp.cov, "distMat")
supportsArg(Exp.cov, "onlyUpper")



