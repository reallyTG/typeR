library(RcppAlgos)


### Name: isPrimeRcpp
### Title: Vectorized Primality Test
### Aliases: isPrimeRcpp

### ** Examples

## check the primality of a single number
isPrimeRcpp(100)

## check the primality of every number in a vector
isPrimeRcpp(1:100)

set.seed(42)
mySamp <- sample(10^13, 100)

## return named vector for easy identification
isPrimeRcpp(mySamp, namedVector = TRUE)



