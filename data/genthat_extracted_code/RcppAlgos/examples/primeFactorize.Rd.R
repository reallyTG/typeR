library(RcppAlgos)


### Name: primeFactorize
### Title: Vectorized Prime Factorization
### Aliases: primeFactorize

### ** Examples

## Get the prime factorization of a single number
primeFactorize(10^8)

## Or get the prime factorization of many numbers
set.seed(29)
myVec <- sample(-1000000:1000000, 1000)
system.time(pFacs <- primeFactorize(myVec))

## Return named list
pFacsWithNames <- primeFactorize(myVec, namedList = TRUE)



