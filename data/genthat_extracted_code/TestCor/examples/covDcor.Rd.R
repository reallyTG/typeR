library(TestCor)


### Name: covDcor
### Title: Returns the theoretical covariance of empirical correlations.
### Aliases: covDcor

### ** Examples

p <- 10
corr_theo <- diag(1,p)
corr_theo[2:p,] <- 0.3
corr_theo[,2:p] <- 0.3
covDcor(corr_theo)



