library(RcppClassicExamples)


### Name: RcppParams
### Title: C++ class for receiving (scalar) parameters from R - deprecated
###   API
### Aliases: RcppParams RcppParamsExample
### Keywords: programming interface

### ** Examples


# set up some value
params <- list(method='BFGS',
               tolerance=1.0e-5,
               maxIter=100,
               startDate=as.Date('2006-7-15'))

# call the underlying  C++ function
result <- RcppParamsExample(params)

# inspect returned object
result




