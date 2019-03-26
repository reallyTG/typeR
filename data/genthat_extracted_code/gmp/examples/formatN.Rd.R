library(gmp)


### Name: formatN
### Title: Format Numbers Keeping Classes Distinguishable
### Aliases: formatN formatN.default formatN.integer formatN.double
###   formatN.bigz formatN.bigq
### Keywords: character print

### ** Examples

## Note that each class is uniquely recognizable from its output:
formatN(    -2:5)# integer
formatN(0 + -2:5)# double precision
formatN(as.bigz(-2:5))
formatN(as.bigq(-2:5, 4))



