library(e1071)


### Name: Discrete
### Title: Discrete Distribution
### Aliases: ddiscrete pdiscrete qdiscrete rdiscrete
### Keywords: distribution

### ** Examples

## a vector of length 30 whose elements are 1 with probability 0.2
## and 2 with probability 0.8.
rdiscrete (30, c(0.2, 0.8))

## a vector of length 100 whose elements are A, B, C, D.
## The probabilities of the four values have the relation 1:2:3:3
rdiscrete (100, c(1,2,3,3), c("A","B","C","D"))




