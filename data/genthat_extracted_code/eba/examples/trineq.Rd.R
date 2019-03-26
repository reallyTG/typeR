library(eba)


### Name: trineq
### Title: Trinary Inequality
### Aliases: trineq print.trineq
### Keywords: models

### ** Examples

data(celebrities)             # absolute choice frequencies
A <- list(c(1,10), c(2,10), c(3,10),
          c(4,11), c(5,11), c(6,11),
          c(7,12), c(8,12), c(9,12))  # the structure of aspects
trineq(celebrities, A)        # check trinary inequality for tree A
trineq(celebrities, A)$chkdf  # trinary inequality for each triple



