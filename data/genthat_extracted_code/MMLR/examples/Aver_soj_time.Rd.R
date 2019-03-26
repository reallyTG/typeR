library(MMLR)


### Name: Aver_soj_time
### Title: Calculating average sojourn time in each state
### Aliases: Aver_soj_time

### ** Examples

lambda <- matrix(c(0, 0.33, 0.45, 0), nrow = 2, ncol = 2, byrow = TRUE)
m <- nrow(lambda)
ld <- as.matrix(rowSums(lambda))
Lambda <- diag(as.vector(ld))
Generator <- t(lambda) - Lambda
Aver_soj_time(1,10,Generator)
## No test: 
Aver_soj_time(2,5,Generator)
## End(No test)



