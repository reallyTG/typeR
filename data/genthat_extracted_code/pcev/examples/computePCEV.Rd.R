library(pcev)


### Name: computePCEV
### Title: Principal Component of Explained Variance
### Aliases: computePCEV

### ** Examples

set.seed(12345)
Y <- matrix(rnorm(100*20), nrow=100)
X <- rnorm(100)
pcev_out <- computePCEV(Y, X)
pcev_out2 <- computePCEV(Y, X, shrink = TRUE)



