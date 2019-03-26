library(RcppExamples)


### Name: RcppListExample
### Title: Examples of uses of List
### Aliases: RcppListExample
### Keywords: programming interface

### ** Examples


# set up some value
params <- list(method='BFGS',
               tolerance=1.0e-5,
               maxIter=100,
               startDate=as.Date('2006-7-15'))

# call the underlying  C++ function
result <- RcppListExample(params)

# inspect returned object
result




