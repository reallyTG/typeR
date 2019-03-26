library(prospectr)


### Name: blockScale
### Title: Hard or soft block scaling
### Aliases: blockScale

### ** Examples

X <- matrix(rnorm(100),ncol=10)
# Hard block scaling
res <- blockScale(X)
apply(res$Xscaled,2,var) # sum of column variances == 1



