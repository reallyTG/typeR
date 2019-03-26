library(MOrder)


### Name: getOrderAIC
### Title: Get order of sequence based on AIC value
### Aliases: getOrderAIC

### ** Examples

## Check a first order sequence
seq <- c(1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2)
getOrderAIC(seq)

## Check for second order sequence
seq <- c(1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2)
getOrderAIC(seq)

## Check for random order sequence
seq <- sample(1:2,50,replace=TRUE)
getOrderAIC(seq)



