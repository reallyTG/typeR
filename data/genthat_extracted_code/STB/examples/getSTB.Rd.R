library(STB)


### Name: getSTB
### Title: Simultaneous Tolerance Bands Using R-Implementation.
### Aliases: getSTB

### ** Examples

## Not run: 
##D set.seed(333)
##D mat <- t(apply(matrix(rnorm(10000*30), ncol=30), 1, sort))
##D stb.obj <- getSTB(mat, timer=TRUE)
##D stb.obj$cov
## End(Not run)



