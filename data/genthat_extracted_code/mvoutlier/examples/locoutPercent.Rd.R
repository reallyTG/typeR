library(mvoutlier)


### Name: locoutPercent
### Title: Diagnostic plot for identifying local outliers with fixed size
###   of neighborhood
### Aliases: locoutPercent
### Keywords: multivariate robust

### ** Examples

# use data from illustrative example in paper:
data(X)
data(Y)
data(dat)
res <- locoutPercent(dat,X,Y,k=10,chisqqu=0.975, indices=c(1,11,24,36))



