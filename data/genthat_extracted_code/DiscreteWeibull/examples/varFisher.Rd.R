library(DiscreteWeibull)


### Name: varFisher
### Title: Observed Fisher information matrix
### Aliases: varFisher
### Keywords: distribution htest

### ** Examples

x <- rdweibull(100, 2/3, 3/2)
estdweibull(x, "ML")
IF <- varFisher(x)[[2]]
diag(IF)
diag(IF)/length(x)
# asymptotic variances of the ML estimators directly estimated from the sample



