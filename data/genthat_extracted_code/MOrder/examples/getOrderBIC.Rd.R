library(MOrder)


### Name: getOrderBIC
### Title: Get order of sequence based on BIC value
### Aliases: getOrderBIC

### ** Examples

## Check a first order sequence
seq <- c(1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2)
getOrderBIC(seq)

## Check for second order sequence
seq <- c(1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2)
getOrderBIC(seq)

## Check for random order sequence
seq <- sample(1:2,50,replace=TRUE)
getOrderBIC(seq)



