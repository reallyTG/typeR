library(SeqAlloc)


### Name: WAICimbal
### Title: Weighted Average of Allocation Imbalance for Covariates
### Aliases: WAICimbal
### Keywords: Allocation Imbalance

### ** Examples

alloc <- rbinom(60,1,.5)
xmat <- matrix(rbinom(240,1,.4),ncol=4)
carwt <- c(.1,.3,.2,.4)

WAICimbal(alloc, xmat, carwt) 



