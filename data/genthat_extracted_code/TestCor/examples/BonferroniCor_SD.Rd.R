library(TestCor)


### Name: BonferroniCor_SD
### Title: Bonferroni multiple testing method for correlations with
###   stepdown procedure.
### Aliases: BonferroniCor_SD

### ** Examples

 
n <- 100
p <- 10
corr_theo <- diag(1,p)
data <- MASS::mvrnorm(n,rep(0,p),corr_theo)
alpha <- 0.05
res <- BonferroniCor_SD(data,alpha,stat_test='empirical')



