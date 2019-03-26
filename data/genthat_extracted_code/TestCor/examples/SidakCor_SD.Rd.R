library(TestCor)


### Name: SidakCor_SD
### Title: Sidak multiple testing method for correlations with stepdown
###   procedure.
### Aliases: SidakCor_SD

### ** Examples

  
n <- 100
p <- 10
corr_theo <- diag(1,p)
data <- MASS::mvrnorm(n,rep(0,p),corr_theo)
alpha <- 0.05
res <- SidakCor_SD(data,alpha,stat_test='empirical')



