library(TestCor)


### Name: covDcorNorm
### Title: Returns the theoretical covariance of test statistics for
###   correlation testing.
### Aliases: covDcorNorm

### ** Examples

p <- 10
corr_theo <- diag(1,p)
corr_theo[2:p,] <- 0.3
corr_theo[,2:p] <- 0.3
covDcorNorm(corr_theo,stat_test='student')



