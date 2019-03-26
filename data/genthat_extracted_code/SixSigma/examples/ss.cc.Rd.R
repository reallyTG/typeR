library(SixSigma)


### Name: ss.cc
### Title: Control Charts
### Aliases: ss.cc

### ** Examples

ss.cc("mr", ss.data.pb1, CTQ = "pb.humidity")
testout <- ss.data.pb1
testout[31,] <- list(31,17)
ss.cc("mr", testout, CTQ = "pb.humidity")




