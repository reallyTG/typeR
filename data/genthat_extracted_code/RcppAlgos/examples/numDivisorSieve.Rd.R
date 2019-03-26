library(RcppAlgos)


### Name: numDivisorSieve
### Title: Apply Divisor Function to Every Element in a Range
### Aliases: numDivisorSieve

### ** Examples

## Generate some random data
set.seed(8128)
mySamp <- sample(10^6, 5*10^5)

## Quickly generate number of divisors for
## every number less than a million
system.time(mySigmas <- numDivisorSieve(10^6))

## Now use result in algorithm
for (s in mySamp) {
    sSig <- mySigmas[s]
    ## Continue algorithm
}

## Generating number of divisors for every
## number in a range is no problem
system.time(sigmaRange <- numDivisorSieve(10^13, 10^13 + 10^6))

## Returning a named vector
numDivisorSieve(10, 20, namedVector = TRUE)
numDivisorSieve(10, namedVector = TRUE)



