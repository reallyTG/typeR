library(RcppExamples)


### Name: RcppDateExample
### Title: C++ classes for interfacing date and datetime R objects
### Aliases: RcppDateExample
### Keywords: programming interface

### ** Examples


# set up date and datetime vectors
dvec <- Sys.Date() + -2:2
dtvec <- Sys.time() + (-2:2)*0.5

# call the underlying  C++ function
result <- RcppDateExample(dvec, dtvec)

# inspect returned object
result



