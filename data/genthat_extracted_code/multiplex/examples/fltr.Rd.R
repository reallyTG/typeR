library(multiplex)


### Name: fltr
### Title: Principal filters
### Aliases: fltr
### Keywords: algebra math

### ** Examples

## Create a data frame
dfr <- data.frame(x=1:3, y=5:7)

## Partial ordering of concepts
PO <- partial.order(galois(dfr),"galois")

## Filter for the first element
fltr(1, PO, rclos=TRUE)




