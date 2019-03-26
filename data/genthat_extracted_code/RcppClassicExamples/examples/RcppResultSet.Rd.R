library(RcppClassicExamples)


### Name: RcppResultSet
### Title: C++ class for sending C++ objects back to R - deprecated API
### Aliases: RcppResultSet
### Keywords: programming interface

### ** Examples


# example from RcppDate
# set up date and datetime vectors
dvec <- Sys.Date() + -2:2
dtvec <- Sys.time() + (-2:2)*0.5

# call the underlying  C++ function
result <- RcppDateExample(dvec, dtvec)

# inspect returned object
result



