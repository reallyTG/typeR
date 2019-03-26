library(popKorn)


### Name: asymmetricIntervals
### Title: Compute Asymmetric Intervals
### Aliases: asymmetricIntervals

### ** Examples

set.seed(18)
p <- 10; n <- 10
Xmat <- matrix(rnorm(p*n), nrow=n, ncol=p)
colnames(Xmat) <- paste("p.", 1:p, sep="")
asymmetricIntervals(Xmat, alpha=0.1, k=4)



