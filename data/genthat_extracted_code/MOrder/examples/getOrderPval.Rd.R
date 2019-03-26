library(MOrder)


### Name: getOrderPval
### Title: Get order of sequence based on P-value
### Aliases: getOrderPval

### ** Examples

## Check a first order sequence
seq <- c(1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2)
getOrderPval(seq)

## Check for second order sequence
seq <- c(1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2)
getOrderPval(seq)

## Check for random order sequence
seq <- sample(1:2,50,replace=TRUE)
getOrderPval(seq)



