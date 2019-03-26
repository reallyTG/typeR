library(popKorn)


### Name: bonferroniIntervals
### Title: Compute Bonferroni Intervals
### Aliases: bonferroniIntervals

### ** Examples

set.seed(18)
p <- 10; n <- 10
Xmat <- matrix(rnorm(p*n), nrow=n, ncol=p)
colnames(Xmat) <- paste("p.", 1:p, sep="")
bonferroniIntervals(Xmat, alpha=0.1, k=4)



