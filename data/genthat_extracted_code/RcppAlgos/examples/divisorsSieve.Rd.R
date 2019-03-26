library(RcppAlgos)


### Name: divisorsSieve
### Title: Generate Complete Factorization for Numbers in a Range
### Aliases: divisorsSieve

### ** Examples

## Generate some random data
set.seed(33550336)
mySamp <- sample(10^5, 5*10^4)

## Quickly generate complete factorizations up 
## to 10^5 (max element from mySamp)
system.time(allFacs <- divisorsSieve(10^5))

## Use generated complete factorization for further
## analysis by accessing the index of allFacs
for (s in mySamp) {
    myFac <- allFacs[[s]]
    ## Continue algorithm
}

## Generating complete factorizations over
## a range is efficient as well
system.time(divisorsSieve(10^12, 10^12 + 10^5))

## Set 'namedList' to TRUE to return a named list
divisorsSieve(27, 30, namedList = TRUE)



