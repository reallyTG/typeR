library(partialAR)


### Name: which.hypothesis.partest
### Title: Returns the preferred hypothesis when testing for partial
###   autoregression
### Aliases: which.hypothesis.partest
### Keywords: ts models

### ** Examples

set.seed(1)
which.hypothesis.partest(test.par(rpar(1000, 0, 1, 0)))  # -> "AR1"
which.hypothesis.partest(test.par(rpar(1000, 0, 0, 1)))  # -> "RW"
which.hypothesis.partest(test.par(rpar(1000, 0, 1, 1)))  # -> "PAR"

which.hypothesis.partest(test.par(rpar(1000, 0, 1, 0), robust=TRUE))   # -> "RAR1"
which.hypothesis.partest(test.par(rpar(1000, 0, 0, 1), robust=TRUE))   # -> "RRW"
which.hypothesis.partest(test.par(rpar(1000, 0.5, 1, 1), robust=TRUE)) # -> "RPAR"



