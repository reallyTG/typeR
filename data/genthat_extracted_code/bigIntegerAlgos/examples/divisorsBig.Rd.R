library(bigIntegerAlgos)


### Name: divisorsBig
### Title: Vectorized Factorization (Complete) with GMP
### Aliases: divisorsBig

### ** Examples

## Get the complete factorization of a single number
divisorsBig(10^15)

## Or get the complete factorization of many numbers
set.seed(29)
myVec <- sample(-1000000:1000000, 1000)
system.time(myFacs <- divisorsBig(myVec))

## Return named list
myFacsWithNames <- divisorsBig(myVec, namedList = TRUE)



