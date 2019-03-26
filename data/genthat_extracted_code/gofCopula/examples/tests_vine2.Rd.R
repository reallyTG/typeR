library(gofCopula)


### Name: gofWhite
### Title: 2 dimensional gof tests based on White's information matrix
###   equality.
### Aliases: gofWhite

### ** Examples

data(IndexReturns)

gofWhite("normal", IndexReturns[c(1:100),c(1:2)], M = 10)



