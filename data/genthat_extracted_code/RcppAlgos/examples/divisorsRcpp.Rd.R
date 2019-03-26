library(RcppAlgos)


### Name: divisorsRcpp
### Title: Vectorized Factorization (Complete)
### Aliases: divisorsRcpp

### ** Examples

## Get the complete factorization of a single number
divisorsRcpp(10^8)

## Or get the complete factorization of many numbers
set.seed(29)
myVec <- sample(-1000000:1000000, 1000)
system.time(myFacs <- divisorsRcpp(myVec))

## Return named list
myFacsWithNames <- divisorsRcpp(myVec, namedList = TRUE)



