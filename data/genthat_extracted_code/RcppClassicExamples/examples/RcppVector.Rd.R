library(RcppClassicExamples)


### Name: RcppVector
### Title: C++ classes for receiving R object in C++ - deprecated API
### Aliases: RcppVector RcppMatrix RcppVectorView RcppMatrixView
###   RcppStringVector RcppVectorExample RcppMatrixExample
###   RcppStringVectorExample
### Keywords: programming interface

### ** Examples

# set up some value
vector <- (seq(1,9))^2

# call the underlying  C++ function
result <- RcppVectorExample(vector)

# inspect returned object
result



