library(TestCor)


### Name: ApplyFwerCor
### Title: Applies multiple testing procedures controlling (asymptotically)
###   the FWER for tests on a correlation matrix.
### Aliases: ApplyFwerCor

### ** Examples

n <- 100
p <- 10
corr_theo <- diag(1,p)
data <- MASS::mvrnorm(n,rep(0,p),corr_theo)
alpha <- 0.05
res <- ApplyFwerCor(data,alpha,stat_test='empirical',method='Bonferroni',stepdown=FALSE)



