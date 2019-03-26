library(RcppAlgos)


### Name: primeFactorizeSieve
### Title: Generate Prime Factorization for Numbers in a Range
### Aliases: primeFactorizeSieve

### ** Examples

## Generate some random data
set.seed(28)
mySamp <- sample(10^5, 5*10^4)

## Quickly generate prime factorizations up 
## to 10^5 (max element from mySamp)
system.time(allPFacs <- primeFactorizeSieve(10^5))

## Use generated prime factorization for further
## analysis by accessing the index of allPFacs
for (s in mySamp) {
    pFac <- allPFacs[[s]]
    ## Continue algorithm
}

## Generating prime factorizations over
## a range is efficient as well
system.time(primeFactorizeSieve(10^12, 10^12 + 10^5))

## Set 'namedList' to TRUE to return a named list
primeFactorizeSieve(27, 30, namedList = TRUE)



