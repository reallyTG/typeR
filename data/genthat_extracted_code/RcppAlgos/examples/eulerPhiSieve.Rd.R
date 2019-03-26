library(RcppAlgos)


### Name: eulerPhiSieve
### Title: Apply Euler's Phi Function to Every Element in a Range
### Aliases: eulerPhiSieve

### ** Examples

## Generate some random data
set.seed(496)
mySamp <- sample(10^6, 5*10^5)

## Quickly generate number of coprime elements for many numbers
system.time(myPhis <- eulerPhiSieve(10^6))

## Now use result in algorithm
for (s in mySamp) {
    sPhi <- myPhis[s]
    ## Continue algorithm
}

## See https://projecteuler.net
system.time(which.max((1:10^6)/eulerPhiSieve(10^6)))

## Generating number of coprime elements
## for every number in a range is no problem
system.time(myPhiRange <- eulerPhiSieve(10^13, 10^13 + 10^6))

## Returning a named vector
eulerPhiSieve(10, 20, namedVector = TRUE)
eulerPhiSieve(10, namedVector = TRUE)



