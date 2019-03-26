library(mmsample)


### Name: ruler
### Title: Rcpp distance calculator
### Aliases: ruler

### ** Examples

set.seed(123)
df <- data.frame(x = rpois(10, 20), y = rnorm(10, 50, 10))
cov_inv <- MASS::ginv(cov(df))
mmsample::ruler(as.matrix(df[2:10, ]), as.numeric(df[1, ]), cov_inv)



