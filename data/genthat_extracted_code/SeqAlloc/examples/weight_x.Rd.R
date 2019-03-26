library(SeqAlloc)


### Name: weight_x
### Title: Calculate weight matrix from matrix of covariates
### Aliases: weight_x

### ** Examples

xrow <- c(1,0,1,1)
xmat <- matrix(rbinom(60,1,.4),ncol=4)
carwt <- c(.6,.4,.2,.1)

weight_x(xrow, xmat, carwt)



