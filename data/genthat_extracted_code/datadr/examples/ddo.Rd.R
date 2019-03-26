library(datadr)


### Name: ddo
### Title: Instantiate a Distributed Data Object ('ddo')
### Aliases: ddo

### ** Examples

kv <- kvPairs(kvPair(1, letters), kvPair(2, rnorm(100)))
kvddo <- ddo(kv)
kvddo



