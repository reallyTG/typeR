library(TestCor)


### Name: eval_stat
### Title: Evaluates the test statistics for tests on correlation matrix
###   entries.
### Aliases: eval_stat

### ** Examples

n <- 100
p <- 10
corr_theo <- diag(1,p)
data <- MASS::mvrnorm(n,rep(0,p),corr_theo)
stat <- eval_stat(data,'fisher')



